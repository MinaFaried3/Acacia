import 'package:acacia/data/network/error/app_failures.dart';
import 'package:acacia/presentation/common/enums/ui_state.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@Immutable()
abstract class BaseState extends Equatable {
  final UiState uiState;
  final Failure? failure;
  const BaseState({required this.uiState, this.failure});

  @override
  List<Object?> get props;
}
