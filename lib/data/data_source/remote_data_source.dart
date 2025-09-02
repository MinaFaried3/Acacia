import 'package:acacia/data/data_source/base_remote_data_source.dart';

abstract class BaseRemoteDataSource<T> extends BaseBaseRemoteDataSource {
  final T apiServiceClient;

  const BaseRemoteDataSource({required this.apiServiceClient});
}
