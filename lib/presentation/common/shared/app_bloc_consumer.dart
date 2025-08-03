import 'package:acacia/presentation/common/shared/base_state.dart';
import 'package:acacia/presentation/common/shared/error_state_actions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocConsumer<B extends BlocBase<S>, S extends BaseState>
    extends StatelessWidget {
  final BlocWidgetBuilder<S> builder;
  final BlocWidgetListener<S>? listener;
  final B? bloc;

  const AppBlocConsumer({
    super.key,
    required this.builder,
    this.listener,
    this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<B, S>(
      bloc: bloc,

      // buildWhen: (previous, current) => previous != current,
      // listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        errorStateActions(context, state);
        if (listener != null) {
          listener!(context, state);
        }
      },
      builder: builder,
    );
  }
}
