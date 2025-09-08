part of 'login_cubit.dart';

@immutable
final class LoginState extends BaseState {
  final UserCredential? user;

  const LoginState({required super.uiState, super.failure, this.user});

  @override
  List<Object?> get props => [uiState, user, failure];

  LoginState copyWith({
    UiState? uiState,
    UserCredential? user,
    Failure? failure,
  }) {
    return LoginState(
      uiState: uiState ?? this.uiState,
      user: user ?? this.user,
      failure: failure ?? this.failure,
    );
  }
}
