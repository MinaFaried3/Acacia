import 'package:acacia/data/data_source/base_remote_data_source.dart';
import 'package:acacia/data/data_source/local_data_source.dart';
import 'package:acacia/data/network/network_checker.dart';
import 'package:acacia/data/repositories/base_repository.dart';

/// this is a Class inherit BaseRepository
///
/// [_remoteDataSource] is type of [UserRemoteDataSource]
///
// ///
class UserRepository extends BaseRepository {
  final BaseBaseRemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;
  final NetworkChecker _networkChecker;

  const UserRepository({
    required BaseBaseRemoteDataSource remoteDataSource,
    required LocalDataSource localDataSource,
    required NetworkChecker networkChecker,
  }) : _remoteDataSource = remoteDataSource,
       _localDataSource = localDataSource,
       _networkChecker = networkChecker;

  // FailureOr<UserCredential> login({
  //   required String email,
  //   required String password,
  // }) async {}

  @override
  NetworkChecker get networkChecker => _networkChecker;

  @override
  BaseBaseRemoteDataSource get remoteDataSource => _remoteDataSource;

  @override
  LocalDataSource get localDataSource => _localDataSource;
}
