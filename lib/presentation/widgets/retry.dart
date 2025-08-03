import 'package:acacia/presentation/resources/styles_manager.dart';
import 'package:acacia/presentation/widgets/space.dart';
import 'package:flutter/material.dart';

import 'responsive/FlexibleFitted.dart';

class Retry extends StatelessWidget {
  const Retry({super.key, required this.onPressed, required this.text});

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // IconButton(
          //     onPressed: onPressed,
          //     icon: const AppSvg(
          //       color: ColorsManager.bluePrimary,
          //       height: 40,
          //       path: As.retryIcon,
          //     )),
          const VerticalSpace(20),
          FittedFlexible(child: Text(text, style: get500MediumStyle())),
        ],
      ),
    );
  }
}
