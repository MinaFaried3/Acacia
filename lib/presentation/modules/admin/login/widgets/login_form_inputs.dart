import 'package:acacia/app/services/validator/validator.dart';
import 'package:acacia/generated/assets.dart';
import 'package:acacia/presentation/modules/admin/login/cubit/login_cubit.dart';
import 'package:acacia/presentation/resources/strings_manager.dart';
import 'package:acacia/presentation/ui/widgets/app_svg.dart';
import 'package:acacia/presentation/ui/widgets/buttons/button.dart';
import 'package:acacia/presentation/ui/widgets/space.dart';
import 'package:acacia/presentation/ui/widgets/text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginFormInputs extends StatefulWidget {
  const LoginFormInputs({super.key});

  @override
  State<LoginFormInputs> createState() => _LoginFormInputsState();
}

class _LoginFormInputsState extends State<LoginFormInputs> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 500),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            AppTextFormField(
              controller: emailController,
              labelText: AppStrings.email.tr(),
              hintText: AppStrings.email.tr(),
              svgPrefixPath: Assets.iconsSms,
              validator: Validator.validateEmail,
            ),
            VerticalSpace(10),

            AppTextFormField(
              controller: passwordController,
              labelText: AppStrings.password.tr(),
              hintText: AppStrings.password.tr(),
              svgPrefixPath: Assets.iconsLock,
              suffix: AppSvg(path: Assets.iconsEye, fit: BoxFit.scaleDown),
              validator: Validator.validatePassword,
            ),
            VerticalSpace(60),
            AppButton(
              text: AppStrings.login.tr(),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.read<LoginCubit>().login(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
