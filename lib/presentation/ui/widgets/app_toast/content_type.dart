import 'package:acacia/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

enum ContentType {
  help,
  failure,
  success,
  warning,
}

extension ContentTypeExtension on ContentType {
  String get message {
    switch (this) {
      case ContentType.help:
        return 'help';
      case ContentType.failure:
        return 'failure';
      case ContentType.success:
        return 'success';
      case ContentType.warning:
        return 'warning';
    }
  }

  Color get color {
    switch (this) {
      case ContentType.help:
        return AppColors.pineTeal;
      case ContentType.failure:
        return AppColors.error;
      case ContentType.success:
        return AppColors.darkFern;
      case ContentType.warning:
        return AppColors.caramelTan;
    }
  }
}
