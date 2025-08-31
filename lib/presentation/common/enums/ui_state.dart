import 'package:acacia/presentation/ui/animation/lottie_animation/loading_indicator.dart';
import 'package:flutter/material.dart';

enum UiState { initial, loading, succeed, failed }

extension UiStateCheck on UiState {
  bool get isInitial => this == UiState.initial;

  bool get isLoading => this == UiState.loading;

  bool get isSucceed => this == UiState.succeed;

  bool get isFailed => this == UiState.failed;
}

extension UiStateX on UiState {
  /// This method requires handling all states.
  T when<T>({
    required T Function() initial,
    required T Function() loading,
    required T Function() succeed,
    required T Function() failed,
  }) {
    switch (this) {
      case UiState.initial:
        return initial();
      case UiState.loading:
        return loading();
      case UiState.succeed:
        return succeed();
      case UiState.failed:
        return failed();
    }
  }

  /// This method allows providing a fallback (`orElse`) for unhandled states.
  T maybeWhen<T>({
    T Function()? initial,
    T Function()? loading,
    T Function()? succeed,
    T Function()? failed,
    required T Function() orElse,
  }) {
    switch (this) {
      case UiState.initial:
        if (initial != null) return initial();
        break;
      case UiState.loading:
        if (loading != null) return loading();
        break;
      case UiState.succeed:
        if (succeed != null) return succeed();
        break;
      case UiState.failed:
        if (failed != null) return failed();
        break;
    }
    return orElse();
  }

  /// This method allows providing a fallback (`orElse`) for unhandled states.
  Widget maybeWhenWidgets<T>({
    Widget Function()? initial,
    Widget Function()? loading,
    Widget Function()? succeed,
    Widget Function()? failed,
    required Widget Function() orElse,
  }) {
    switch (this) {
      case UiState.initial:
        if (initial != null) return initial();
        break;
      case UiState.loading:
        if (loading != null) return loading();
        return Stack(
          children: [
            orElse(),
            Positioned.fill(
              child: Container(
                color: Colors.white.withOpacity(
                  0.75,
                ), // Semi-transparent overlay.
              ),
            ),
            Align(alignment: Alignment.center, child: LoadingIndicator()),
          ],
        );
        break;
      case UiState.succeed:
        if (succeed != null) return succeed();
        break;
      case UiState.failed:
        if (failed != null) return failed();
        break;
    }
    return orElse();
  }

  /// This method returns `null` if a state is not handled.
  T? whenOrNull<T>({
    T Function()? initial,
    T Function()? loading,
    T Function()? succeed,
    T Function()? failed,
  }) {
    switch (this) {
      case UiState.initial:
        return initial != null ? initial() : null;
      case UiState.loading:
        return loading != null ? loading() : null;
      case UiState.succeed:
        return succeed != null ? succeed() : null;
      case UiState.failed:
        return failed != null ? failed() : null;
    }
  }
}
