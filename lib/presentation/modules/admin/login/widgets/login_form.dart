import 'package:acacia/presentation/common/enums/ui_state.dart';
import 'package:acacia/presentation/common/shared/app_bloc_consumer.dart';
import 'package:acacia/presentation/modules/admin/login/cubit/login_cubit.dart';
import 'package:acacia/presentation/modules/admin/login/widgets/form_header.dart';
import 'package:acacia/presentation/modules/admin/login/widgets/login_form_inputs.dart';
import 'package:acacia/presentation/ui/widgets/space.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppBlocConsumer<LoginCubit, LoginState>(
        builder: (context, state) {
          return state.uiState.maybeWhenWidgets(
            orElse: () => SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //welcome message
                  FormHeaderMessage(),

                  VerticalSpace(60),
                  //form inputs
                  LoginFormInputs(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
