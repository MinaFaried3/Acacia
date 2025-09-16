import 'package:acacia/generated/assets.dart';
import 'package:acacia/presentation/ui/widgets/app_toast/toast_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui' as ui;
import 'dart:math' as math;

class AppToast extends StatelessWidget {
  final String title;
  final String message;
  final Color? color;
  final ToastType contentType;
  final bool inMaterialBanner;
  final TextStyle? titleTextStyle;
  final TextStyle? messageTextStyle;

  const AppToast({
    super.key,
    this.color,
    this.titleTextStyle,
    this.messageTextStyle,
    required this.title,
    required this.message,
    required this.contentType,
    this.inMaterialBanner = false,
  });

  @override
  Widget build(BuildContext context) {
    final isRTL = Directionality.of(context) == TextDirection.rtl;
    final size = MediaQuery.of(context).size;

    final isMobile = size.width <= 768;
    final isTablet = size.width > 768 && size.width <= 992;

    final hsl = HSLColor.fromColor(color ?? contentType.color);
    final hslDark = hsl.withLightness((hsl.lightness - 0.1).clamp(0.0, 1.0));

    var horizontalPadding = 0.0;
    var leftSpace = size.width * 0.12;
    final rightSpace = size.width * 0.12;

    if (isMobile) {
      horizontalPadding = size.width * 0.01;
    } else if (isTablet) {
      leftSpace = size.width * 0.05;
      horizontalPadding = size.width * 0.2;
    } else {
      leftSpace = size.width * 0.05;
      horizontalPadding = size.width * 0.3;
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontalPadding),
      height: isMobile ? 100 : 130,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: size.width,
            decoration: BoxDecoration(
              color: color ?? contentType.color,
              borderRadius: BorderRadius.circular(20),
            ),
          ),

          Positioned(
            bottom: 0,
            left: !isRTL ? 0 : null,
            right: isRTL ? 0 : null,
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(isRTL ? math.pi : math.pi * 2),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                ),
                child: SvgPicture.asset(
                  Assets.pharaohsLotusFlower,
                  height: 50,
                  width: 50,
                  colorFilter: _getColorFilter(
                    hslDark.toColor(),
                    ui.BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            top: -size.height * 0.015,
            left: !isRTL
                ? leftSpace -
                      8 -
                      (isMobile ? size.width * 0.075 : size.width * 0.035)
                : null,
            right: isRTL
                ? rightSpace -
                      8 -
                      (isMobile ? size.width * 0.075 : size.width * 0.035)
                : null,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset(
                  Assets.iconsBack,
                  height: 45,
                  colorFilter: _getColorFilter(
                    hslDark.toColor(),
                    ui.BlendMode.srcIn,
                  ),
                ),
                Positioned(
                  top: size.height * 0.015,
                  child: SvgPicture.asset(assetSVG(contentType), height: 18),
                ),
              ],
            ),
          ),

          /// content
          Positioned.fill(
            left: isRTL ? size.width * 0.03 : leftSpace,
            right: isRTL ? rightSpace : size.width * 0.03,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max, // 👈 مهم عشان يتوزع صح
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// `title` parameter
                      Expanded(
                        flex: 3,
                        child: Text(
                          title,
                          style:
                              titleTextStyle ??
                              TextStyle(
                                fontSize: !isMobile ? 22 : 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          if (inMaterialBanner) {
                            ScaffoldMessenger.of(
                              context,
                            ).hideCurrentMaterialBanner();
                            return;
                          }
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        },
                        icon: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: size.height * 0.022,
                        ),
                      ),
                    ],
                  ),

                  /// `message` body text parameter
                  Text(
                    message,
                    style:
                        messageTextStyle ??
                        TextStyle(
                          fontSize: isMobile ? 14 : 16,
                          color: Colors.white,
                        ),
                    maxLines: isMobile ? 2 : 3,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Reflecting proper icon based on the contentType
  String assetSVG(ToastType contentType) {
    switch (contentType) {
      case ToastType.failure:
        return Assets.iconsFailure;
      case ToastType.success:
        return Assets.iconsSuccess;
      case ToastType.warning:
        return Assets.iconsWarning;
      case ToastType.help:
        return Assets.iconsHelp;
    }
  }

  static ColorFilter? _getColorFilter(
    ui.Color? color,
    ui.BlendMode colorBlendMode,
  ) => color == null ? null : ui.ColorFilter.mode(color, colorBlendMode);
}
