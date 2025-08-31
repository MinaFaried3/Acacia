import 'package:acacia/presentation/modules/admin/login/widgets/form_header.dart';
import 'package:acacia/presentation/modules/admin/login/widgets/login_form_inputs.dart';
import 'package:acacia/presentation/ui/widgets/space.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
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
  }
}
