import 'package:acacia/app/services/di/dependency_injection.dart';
import 'package:acacia/app/shared/common/printer_manager.dart';
import 'package:acacia/data/network/error/app_failures.dart';
import 'package:acacia/data/repositories/user_repository_impl.dart';
import 'package:acacia/presentation/common/enums/ui_state.dart';
import 'package:acacia/presentation/common/shared/base_state.dart';
import 'package:acacia/presentation/common/shared/safe_emitter.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> with SafeEmitter {
  LoginCubit() : super(const LoginState(uiState: UiState.initial));

  final UserRepository repository = getIt<UserRepository>();

  void login({required String email, required String password}) async {
    safeEmit(state.copyWith(uiState: UiState.loading));

    final result = await repository.login(email: email, password: password);

    result.fold(
      (l) => safeEmit(state.copyWith(uiState: UiState.failed, failure: l)),
      (r) {
        printer("r.user ${r.user}");
        printer("r.user?.email ${r.user?.email}");
        printer("r.user?.displayName ${r.user?.displayName}");
        printer("r.user?.emailVerified ${r.user?.emailVerified}");
        printer("r.user?.isAnonymous ${r.user?.isAnonymous}");
        printer("r.user?.phoneNumber ${r.user?.phoneNumber}");
        printer("r.user?.photoURL ${r.user?.photoURL}");
        printer("r.user?.refreshToken ${r.user?.refreshToken}");
        printer("r.user?.tenantId ${r.user?.tenantId}");
        printer("r.user?.uid ${r.user?.uid}");
        printer("==============================");
        printer(
          "r.user?.providerData.first.uid ${r.user?.providerData.first.uid}",
        );
        printer("r.user?.providerData.length ${r.user?.providerData.length}");
        printer("==============================");
        printer("==============================");
        printer("r.credential?.accessToken ${r.credential?.accessToken}");
        printer(
          "r.additionalUserInfo?.profile ${r.additionalUserInfo?.profile}",
        );
        printer(
          "r.additionalUserInfo?.username ${r.additionalUserInfo?.username}",
        );

        /*
UserCredential(additionalUserInfo: AdditionalUserInfo(isNewUser: false, profile: {}, providerId: password, username: null, authorizationCode: null), credential: null, user: User(displayName: null, email: acacia@acacia.com, isEmailVerified: false, isAnonymous: false, metadata: UserMetadata(creationTime: 2025-09-08 16:35:32.000Z, lastSignInTime: 2025-09-08 16:58:17.000Z), phoneNumber: null, photoURL: null, providerData, [UserInfo(displayName: null, email: acacia@acacia.com, phoneNumber: null, photoURL: null, providerId: password, uid: acacia@acacia.com)], refreshToken: AMf-vBz5XWHFRUf9QZY4y-zP2KCTCmppz9cZRho_WUuADMRTPxGlQGogPyceeJyGCCKSCtryyHeClZLjjKzNp7T6zDSWul5U1GasVWPS8q6AQs8WBac1tdrZCLqIoBR5hXc8zCwB6jkWE5kCcXeugh-SGB-040PQWpM8IkPTGVDySl4pRrNSmaxCeQ9rQ00r5xdN60cZ3ZSC, tenantId: null, uid: ogvjfn9sypcJ9wr9JVHAFTtBTkF2))
r.user User(displayName: null, email: acacia@acacia.com, isEmailVerified: false, isAnonymous: false, metadata: UserMetadata(creationTime: 2025-09-08 16:35:32.000Z, lastSignInTime: 2025-09-08 16:58:17.000Z), phoneNumber: null, photoURL: null, providerData, [UserInfo(displayName: null, email: acacia@acacia.com, phoneNumber: null, photoURL: null, providerId: password, uid: acacia@acacia.com)], refreshToken: AMf-vBz5XWHFRUf9QZY4y-zP2KCTCmppz9cZRho_WUuADMRTPxGlQGogPyceeJyGCCKSCtryyHeClZLjjKzNp7T6zDSWul5U1GasVWPS8q6AQs8WBac1tdrZCLqIoBR5hXc8zCwB6jkWE5kCcXeugh-SGB-040PQWpM8IkPTGVDySl4pRrNSmaxCeQ9rQ00r5xdN60cZ3ZSC, tenantId: null, uid: ogvjfn9sypcJ9wr9JVHAFTtBTkF2)
r.user?.email acacia@acacia.com
r.user?.displayName null
r.user?.emailVerified false
r.user?.isAnonymous false
r.user?.phoneNumber null
r.user?.photoURL null
r.user?.refreshToken AMf-vBz5XWHFRUf9QZY4y-zP2KCTCmppz9cZRho_WUuADMRTPxGlQGogPyceeJyGCCKSCtryyHeClZLjjKzNp7T6zDSWul5U1GasVWPS8q6AQs8WBac1tdrZCLqIoBR5hXc8zCwB6jkWE5kCcXeugh-SGB-040PQWpM8IkPTGVDySl4pRrNSmaxCeQ9rQ00r5xdN60cZ3ZSC
r.user?.tenantId null
r.user?.uid ogvjfn9sypcJ9wr9JVHAFTtBTkF2
==============================
r.user?.providerData.first.uid acacia@acacia.com
r.user?.providerData.length 1
==============================
==============================
r.credential?.accessToken null
r.additionalUserInfo?.profile {}
r.additionalUserInfo?.username null
        * */
        safeEmit(state.copyWith(uiState: UiState.succeed, user: r));
      },
    );
  }
}
