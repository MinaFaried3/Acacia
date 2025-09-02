import 'package:acacia/data/data_source/base_remote_data_source.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseRemoteDataSource extends BaseBaseRemoteDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  const FirebaseRemoteDataSource({required this.auth, required this.firestore});

  @override
  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    return await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
