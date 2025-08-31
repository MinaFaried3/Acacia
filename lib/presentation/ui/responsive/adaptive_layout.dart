import 'package:acacia/app/shared/extensions/empty_or_null.dart';
import 'package:flutter/material.dart';

class AdaptiveLayout extends StatelessWidget {
  const AdaptiveLayout({
    super.key,
    required this.mobileLayout,
    this.tabletLayout,
    this.desktopLayout,
  });

  final WidgetBuilder mobileLayout;
  final WidgetBuilder? tabletLayout, desktopLayout;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        final desktopBreakPoint = tabletLayout.isNull ? 800 : 1200;

        if (desktopLayout.isNotNull &&
            constrains.maxWidth > desktopBreakPoint) {
          return desktopLayout!(context);
        } else if (tabletLayout.isNotNull && constrains.maxWidth > 700) {
          return tabletLayout!(context);
        } else {
          return mobileLayout(context);
        }
      },
    );
  }
}
