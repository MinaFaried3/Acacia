part of 'app_cubit.dart';

class AppState extends BaseState {
  final String? openingRoutePath;
  final bool showLaterButton;
  final bool showIgnoreButton;
  final bool showSubscription;
  final bool showBankPayment;

  const AppState({
    required super.uiState,
    super.failure,

    this.openingRoutePath,
    this.showLaterButton = true,
    this.showIgnoreButton = true,
    this.showSubscription = false,
    this.showBankPayment = false,
  });

  @override
  List<Object?> get props => [
    openingRoutePath,
    uiState,
    failure,
    showLaterButton,
    showIgnoreButton,
    showSubscription,
    showBankPayment,
  ];

  AppState copyWith({
    UiState? uiState,
    Failure? failure,
    String? openingRoutePath,
    bool? showLaterButton,
    bool? showIgnoreButton,
    bool? showSubscription,
    bool? showBankPayment,
  }) {
    return AppState(
      uiState: uiState ?? this.uiState,
      failure: failure ?? this.failure,
      openingRoutePath: openingRoutePath ?? this.openingRoutePath,
      showLaterButton: showLaterButton ?? this.showLaterButton,
      showIgnoreButton: showIgnoreButton ?? this.showIgnoreButton,
      showSubscription: showSubscription ?? this.showSubscription,
      showBankPayment: showBankPayment ?? this.showBankPayment,
    );
  }
}
