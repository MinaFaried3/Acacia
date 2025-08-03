abstract class BaseRemoteDataSource<T> {
  final T apiServiceClient;

  const BaseRemoteDataSource({
    required this.apiServiceClient,
  });
}
