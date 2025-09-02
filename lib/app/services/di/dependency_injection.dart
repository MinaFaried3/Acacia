import 'package:acacia/app/app_cubit.dart';
import 'package:acacia/app/shared/common/printer_manager.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import '../../shared/common/bloc_observer.dart' show MyBlocObserver;

final GetIt getIt = GetIt.instance;

final class DIModulesManger {
  static Future<void> prepareAppModule() async {
    //get it
    getIt.allowReassignment = true;

    //network checker
    // getIt.registerLazySingleton<NetworkChecker>(() =>
    //     NetworkCheckerImpl(connectionChecker: InternetConnectionChecker()));

    //firebase
    getIt.registerLazySingleton<FirebaseAnalytics>(
      () => FirebaseAnalytics.instance,
    );
    getIt.registerLazySingleton<FirebaseCrashlytics>(
      () => FirebaseCrashlytics.instance,
    );

    getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

    getIt.registerLazySingleton<FirebaseFirestore>(
      () => FirebaseFirestore.instance,
    );

    // getIt.registerLazySingleton<AppRemoteConfig>(() => AppRemoteConfig(
    //     firebaseRemoteConfig: FirebaseRemoteConfig.instance,
    //     networkChecker: getIt<NetworkChecker>()));

    // await getIt<AppRemoteConfig>().fetchAndActivate();
    //app info
    // final packageInfo = await PackageInfo.fromPlatform();
    // getIt.registerLazySingleton<PackageInfo>(() => packageInfo);

    //bloc
    if (kDebugMode) {
      getIt.registerLazySingleton<MyBlocObserver>(() => MyBlocObserver());
    }

    // // Initialize Hive (you can specify a directory if needed)
    // await Hive.initFlutter();

    // // Open a Hive box for storing preferences
    // final Box hiveBox = await Hive.openBox('appPreferences');

    // // Register Hive Box with getIt
    // getIt.registerLazySingleton<Box>(() => hiveBox);

    getIt.registerFactory<AppCubit>(() => AppCubit());
    // //register secure storage
    // getIt.registerLazySingleton<FlutterSecureStorage>(
    //     () => FlutterSecureStorage());
    //
    // // Register AppPreferences with Hive dependency
    // getIt.registerLazySingleton<AppPreferences>(
    //   () => AppPreferences(
    //     hiveBox: getIt<Box>(),
    //     secureStorage: getIt<FlutterSecureStorage>(),
    //   ),
    // );
    //
    // //dio factory
    // final Dio dio = Dio();
    // getIt.registerLazySingleton<Dio>(() => dio);
    //
    // if (AppMode.devMode) {
    //   getIt.registerLazySingleton<Alice>(() => Alice(
    //         showNotification: true,
    //         showShareButton: true,
    //         navigatorKey: MyApp.navigatorKey,
    //       ));
    // }
    //
    // getIt.registerLazySingleton<DioFactory>(() => DioFactory(
    //       appPreferences: getIt<AppPreferences>(),
    //       dio: getIt<Dio>(),
    //       alice: AppMode.devMode ? getIt<Alice>() : null,
    //     ));
    //
    // // api service client
    // final Dio getDio = await getIt<DioFactory>().dio;
    // getIt.registerLazySingleton<ApiServiceClient>(
    //     () => ApiServiceClient(getDio));
    //
    // //remote data source
    // getIt
    //     .registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSource(
    //           apiServiceClient: getIt<ApiServiceClient>(),
    //         ));
    //
    // //local data source
    // getIt.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());
    //
    // //repository
    //
    // getIt.registerLazySingleton<Location>(() => Location());
    //
    // //cubit
  }

  static void _registerFactory<T extends Object>(
    T object, {
    String? instanceName,
  }) {
    bool isRegistered = getIt.isRegistered<T>(instanceName: instanceName);

    if (!isRegistered) {
      getIt.registerFactory<T>(() => object, instanceName: instanceName);
    }

    _printHint<T>(isRegistered);
  }

  static void _registerFactoryCubit<T extends Cubit>(T object) {
    //todo
    // if(object.isClosed)
    getIt.registerFactory<T>(() => object);

    bool isRegistered = getIt.isRegistered<T>();
    _printHint<T>(isRegistered);
  }

  static void _registerFactoryBloc<T extends Bloc>(T object) {
    getIt.registerFactory<T>(() => object);
    bool isRegistered = getIt.isRegistered<T>();
    _printHint<T>(isRegistered);
  }

  static void _printHint<T extends Object>(bool isRegistered) {
    if (isRegistered) {
      printer('$T is already registered factory no thing new');
    } else {
      printer('$T is registered factory');
    }
  }

  static void _printIsRegistered<T extends Object>() {
    printer('$T is registered factory');
  }

  static void disposeBloc<T extends BlocBase>() {
    getIt<T>().close();

    getIt.unregister<T>();
    if (!(GetIt.I.isRegistered<T>())) {
      printer('$T is unregistered');
    }
  }
}
