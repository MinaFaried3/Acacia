import 'package:acacia/app/config/platform/platform.dart';
import 'package:equatable/equatable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkChecker extends Equatable {
  Future<bool> get isConnected;
}

class NetworkCheckerImpl extends NetworkChecker {
  final InternetConnectionChecker? _connectionChecker;

  NetworkCheckerImpl({required InternetConnectionChecker? connectionChecker})
    : _connectionChecker = connectionChecker;

  @override
  Future<bool> get isConnected {
    if (currentPlatform.isWeb) return Future.value(true);
    return _connectionChecker!.hasConnection;
  }

  @override
  List<Object?> get props => [isConnected, _connectionChecker];
}
