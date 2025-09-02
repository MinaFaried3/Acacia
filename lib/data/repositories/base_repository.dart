import 'package:acacia/app/services/di/dependency_injection.dart';
import 'package:acacia/app/shared/common/printer_manager.dart';
import 'package:acacia/app/shared/common/typedefs.dart';
import 'package:acacia/data/data_source/base_remote_data_source.dart';
import 'package:acacia/data/data_source/local_data_source.dart';
import 'package:acacia/data/network/dio_factory/dio_factory.dart';
import 'package:acacia/data/network/error/api/data_source_status.dart';
import 'package:acacia/data/network/error/api/network_error_handler.dart';
import 'package:acacia/data/network/error/app_failures.dart';
import 'package:acacia/data/network/error/firebase/firebase_error_handler.dart';
import 'package:acacia/data/network/network_checker.dart';
import 'package:acacia/data/responses/base_response/base_response.dart';
import 'package:acacia/presentation/resources/strings_manager.dart';
import 'package:dartz/dartz.dart';

abstract class BaseRepository {
  BaseBaseRemoteDataSource get remoteDataSource;

  NetworkChecker get networkChecker;

  LocalDataSource get localDataSource;

  const BaseRepository();

  FailureOr<Model> executeFirebaseCall<Model>({
    required Future<Model> Function() firebaseCall,
    Future<void> Function(Model)? onSuccess,
  }) async {
    return await runWithNetworkCheck(
      action: () async {
        try {
          final result = await firebaseCall();

          if (onSuccess != null) {
            await onSuccess(result);
          }
          printer(result, color: ConsoleColor.magenta);
          return Right(result);
        } catch (error) {
          // 🔥 Unified Firebase error handling
          final failure = FirebaseErrorHandler.handle(error).failure;
          printer(error.toString(), color: ConsoleColor.reset);
          return Left(failure);
        }
      },
    );
  }

  FailureOr<Model> runWithNetworkCheck<Model>({
    required FailureOr<Model> Function() action,
  }) async {
    if (!await networkChecker.isConnected) {
      return Left(DataSourceStatus.noInternetConnection.getFailure());
    }
    return await action();
  }

  FailureOr<Model> executeApiCall<Model>({
    required FutureBaseRes<Model> Function() apiCall,
    Future<void> Function(Model)? onSuccess,
    bool refreshDioOptions = false,
  }) async {
    return await runWithNetworkCheck(
      action: () async {
        await refreshDioOptionsIfNeeded(refreshDioOptions);

        try {
          final response = await apiCall();

          if (response.status == true) {
            if (onSuccess != null) await onSuccess(response.data);
            return Right(response.data);
          } else {
            // AppLogger().warning(response.status);
            // AppLogger().warning(response.message);
            return Left(
              ServerFailure(
                code: response.code ?? ApiInternalStatus.failure,
                message: response.message ?? AppStrings.defaultError,
              ),
            );
          }
        } catch (error) {
          // AppLogger().error(error.toString());
          printer(error.toString(), color: ConsoleColor.reset);
          return Left(ErrorHandler.handle(error).failure);
        }
      },
    );
  }

  Future<void> refreshDioOptionsIfNeeded(bool refreshDioOptions) async {
    if (refreshDioOptions) {
      // refresh if connection is off
      await getIt<DioFactory>().refreshDioOptionsWithToken();
    }
  }

  FailureOr<BaseResponse> executeBaseResponseCall({
    required Future<BaseResponse> Function() apiCall,
    bool refreshDioOptions = false,
  }) async {
    if (!await networkChecker.isConnected) {
      return Left(DataSourceStatus.noInternetConnection.getFailure());
    }
    await refreshDioOptionsIfNeeded(refreshDioOptions);
    try {
      final BaseResponse response = await apiCall();

      if (response.status == true) {
        return Right(response);
      } else {
        // AppLogger().warning(response.status);
        // AppLogger().warning(response.message);
        return Left(
          ServerFailure(
            code: response.code ?? ApiInternalStatus.failure,
            message: response.message ?? AppStrings.defaultError,
          ),
        );
      }
    } catch (error) {
      // AppLogger().error(error.toString());
      printer(error.toString(), color: ConsoleColor.reset);
      return Left(ErrorHandler.handle(error).failure);
    }
    return Left(DataSourceStatus.noInternetConnection.getFailure());
  }

  FailureOrList<Model> executePaginationApiCall<Model>({
    required FutureBasePaginationRes<Model> Function() apiCall,
    bool refreshDioOptions = false,
  }) async {
    if (!await networkChecker.isConnected) {
      return Left(DataSourceStatus.noInternetConnection.getFailure());
    }
    await refreshDioOptionsIfNeeded(refreshDioOptions);
    try {
      final response = await apiCall();

      if (response.status == true) {
        return Right(response.data.items.data);
      } else {
        return Left(
          ServerFailure(
            code: response.code ?? ApiInternalStatus.failure,
            message: response.message ?? AppStrings.defaultError,
          ),
        );
      }
    } catch (error) {
      // AppLogger().error(error.toString());
      printer(error.toString(), color: ConsoleColor.reset);
      return Left(ErrorHandler.handle(error).failure);
    }
    return Left(DataSourceStatus.noInternetConnection.getFailure());
  }

  FailureOr<Model> executeMapsApiCall<Model>({
    required Future<Model> Function() apiCall,
    bool refreshDioOptions = false,
  }) async {
    if (!await networkChecker.isConnected) {
      return Left(DataSourceStatus.noInternetConnection.getFailure());
    }
    await refreshDioOptionsIfNeeded(refreshDioOptions);
    try {
      final response = await apiCall();
      return Right(response);
    } catch (error) {
      // AppLogger().error(error.toString());
      printer(error.toString(), color: ConsoleColor.reset);
      return Left(ErrorHandler.handle(error).failure);
    }
  }
}
