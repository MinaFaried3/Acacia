import 'package:acacia/app/shared/common/constants.dart';
import 'package:acacia/presentation/ui/animation/lottie_animation/loading_indicator.dart';
import 'package:acacia/presentation/ui/widgets/buttons/button.dart';
import 'package:acacia/presentation/ui/widgets/buttons/outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'button_type_enum.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({
    super.key,
    this.text,
    this.onPressed,
    this.isLoading = false,
    this.buttonStyle = AppButtonStyle.solidBackground,
  });

  factory LoadingButton.loading() => const LoadingButton(isLoading: true);

  final String? text;
  final void Function()? onPressed;
  final bool isLoading;
  final AppButtonStyle buttonStyle;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(seconds: 1),
      transitionBuilder: (child, animation) => SizeTransition(
        sizeFactor: animation,
        axis: Axis.horizontal,
        child: child,
      ),
      child: isLoading ? LoadingIndicator(width: 150.w) : _buildButton(),
    );
  }

  Widget _buildButton() {
    switch (buttonStyle) {
      case AppButtonStyle.solidBackground:
        return AppButton(
          onPressed: onPressed ?? () {},
          text: text ?? AppConstants.emptyString,
        );
      case AppButtonStyle.outlined:
        return AppOutlinedButton(
          onPressed: onPressed ?? () {},
          text: text ?? AppConstants.emptyString,
        );
    }
  }
}
