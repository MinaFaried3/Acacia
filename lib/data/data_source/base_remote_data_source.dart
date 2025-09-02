import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseBaseRemoteDataSource {
  const BaseBaseRemoteDataSource();

  Future<UserCredential> login({
    required String email,
    required String password,
  });
}
