import 'package:acacia/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

enum ToastType { help, failure, success, warning }

extension ToastTypeExtension on ToastType {
  String get message {
    switch (this) {
      case ToastType.help:
        return 'help';
      case ToastType.failure:
        return 'failure';
      case ToastType.success:
        return 'success';
      case ToastType.warning:
        return 'warning';
    }
  }

  Color get color {
    switch (this) {
      case ToastType.help:
        return AppColors.pineTeal;
      case ToastType.failure:
        return AppColors.error;
      case ToastType.success:
        return AppColors.darkFern;
      case ToastType.warning:
        return AppColors.caramelTan;
    }
  }
}
