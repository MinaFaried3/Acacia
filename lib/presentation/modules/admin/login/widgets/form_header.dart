import 'package:acacia/generated/assets.dart';
import 'package:acacia/presentation/resources/color_manager.dart';
import 'package:acacia/presentation/resources/strings_manager.dart';
import 'package:acacia/presentation/resources/styles_manager.dart';
import 'package:acacia/presentation/ui/responsive/responsive.dart';
import 'package:acacia/presentation/ui/widgets/app_svg.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FormHeaderMessage extends StatelessWidget {
  const FormHeaderMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSvg(path: Assets.pharaohsLotusFlower, color: AppColors.sageGreen),
        Text(
          AppStrings.welcomeAtAcacia.tr(),
          style: get500MediumStyle(fontSize: 40.toResponsive(context)),
        ),
        Text(
          AppStrings.enterFollowingData.tr(),
          style: get400RegularStyle(
            fontSize: 16.toResponsive(context),
            color: AppColors.camelBeige,
          ),
        ),
      ],
    );
  }
}
