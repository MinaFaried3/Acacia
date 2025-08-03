import 'package:acacia/app/shared/common/constants.dart';

extension NonNullableInt on int? {
  int orZero() {
    if (this == null) {
      return AppConstants.zero;
    }
    return this!;
  }
}

extension NonNullableDouble on double? {
  double orZero() {
    if (this == null) {
      return AppConstants.zero.toDouble();
    }
    return this!;
  }
}

extension NonNullableString on String? {
  String orEmpty() {
    if (this == null) return AppConstants.emptyString;
    return this!;
  }
}

extension NonNullableBool on bool? {
  bool orFalse() {
    if (this == null) return false;
    return this!;
  }
}

extension NonNullableList on List? {
  List orEmpty() {
    if (this == null) return AppConstants.emptyList;
    return this!;
  }
}

extension NonNullableMap on Map? {
  Map orEmpty() {
    if (this == null) return AppConstants.emptyMap;
    return this!;
  }
}

extension NonNullableSet on Set? {
  Set orEmpty() {
    if (this == null) return AppConstants.emptySet;
    return this!;
  }
}
