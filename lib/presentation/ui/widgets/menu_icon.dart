import 'package:flutter/material.dart';

class MenuIcon extends StatelessWidget {
  const MenuIcon({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      splashColor: Colors.transparent,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // AppSvg(
          //   path: AssetsProvider.menuIcon,
          //   fit: BoxFit.scaleDown,
          // ),
          // AppSvg(
          //   path: AssetsProvider.menuIcon,
          //   fit: BoxFit.scaleDown,
          // ),
        ],
      ),
    );
  }
}
