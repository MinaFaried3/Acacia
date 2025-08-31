import 'package:acacia/generated/assets.dart';
import 'package:acacia/presentation/resources/strings_manager.dart';
import 'package:acacia/presentation/ui/widgets/app_svg.dart';
import 'package:acacia/presentation/ui/widgets/buttons/button.dart';
import 'package:acacia/presentation/ui/widgets/space.dart';
import 'package:acacia/presentation/ui/widgets/text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          labelText: AppStrings.email.tr(),
          hintText: AppStrings.email.tr(),
          svgPrefixPath: Assets.iconsSms,
        ),
        VerticalSpace(10),
        AppTextFormField(
          labelText: AppStrings.password.tr(),
          hintText: AppStrings.password.tr(),
          svgPrefixPath: Assets.iconsLock,
          suffix: AppSvg(path: Assets.iconsEye, fit: BoxFit.scaleDown),
        ),
        VerticalSpace(30),
        AppButton(text: AppStrings.login.tr(), onPressed: () {}),
      ],
    );
  }
}
