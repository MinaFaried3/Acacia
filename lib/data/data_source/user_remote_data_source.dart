import 'package:acacia/data/data_source/base_remote_data_source.dart';
import 'package:acacia/data/network/api_service_client.dart';

class UserRemoteDataSource extends BaseRemoteDataSource<ApiServiceClient> {
  const UserRemoteDataSource({required super.apiServiceClient});
}
