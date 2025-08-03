import 'package:acacia/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key, this.height, this.width});

  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: AppSize.s1_5,
        valueColor: AlwaysStoppedAnimation<Color>(
          Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}

class LoadingClipper extends CustomClipper<Path> {
  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }

  @override
  Path getClip(Size size) {
    final path = Path();

    final double width = size.width;
    final double height = size.height;

    final double clipUntil3 = height * AppSize.s0_32;
    final double clipUntil7 = height * AppSize.s0_7;

    path.moveTo(0, clipUntil3);
    path.lineTo(width, clipUntil3);
    path.lineTo(width, clipUntil7);
    path.lineTo(0, clipUntil7);
    path.lineTo(0, clipUntil3);

    return path;
  }
}

class LoadingClipperRect extends CustomClipper<Rect> {
  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, size.height * 0.5, size.width, size.height * 0.5);
  }
}
