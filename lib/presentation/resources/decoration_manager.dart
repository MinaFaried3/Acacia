import 'package:acacia/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color_manager.dart';

class DecorationManager {
  static BoxDecoration whiteRoundedBox = BoxDecoration(
    color: AppColors.white,
    borderRadius: BorderRadius.circular(12.r),
  );

  static BoxDecoration mintRoundedBox = BoxDecoration(
    borderRadius: BorderRadius.circular(AppSize.s20.r),
    color: AppColors.lightMintGreenBgColor,
  );
}
