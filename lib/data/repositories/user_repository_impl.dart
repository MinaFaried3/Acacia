import 'package:acacia/data/data_source/local_data_source.dart';
import 'package:acacia/data/data_source/user_remote_data_source.dart';
import 'package:acacia/data/network/network_checker.dart';
import 'package:acacia/data/repositories/base_repository.dart';

/// this is a Class inherit BaseRepository
///
/// [_remoteDataSource] is type of [UserRemoteDataSource]
///
///
class UserRepository extends BaseRepository {
  final UserRemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;
  final NetworkChecker _networkChecker;

  const UserRepository({
    required UserRemoteDataSource remoteDataSource,
    required LocalDataSource localDataSource,
    required NetworkChecker networkChecker,
  }) : _remoteDataSource = remoteDataSource,
       _localDataSource = localDataSource,
       _networkChecker = networkChecker;

  @override
  NetworkChecker get networkChecker => _networkChecker;

  @override
  UserRemoteDataSource get remoteDataSource => _remoteDataSource;

  @override
  LocalDataSource get localDataSource => _localDataSource;
}
