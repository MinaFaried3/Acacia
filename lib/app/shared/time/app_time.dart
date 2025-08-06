// import 'package:acacia/app/shared/common/printer_manager.dart';
// import 'package:acacia/app/shared/extensions/empty_or_null.dart';

abstract class AppTime {
  static const int secondsInMinute = 60;
  static const int secondsInHour = 3600;
  static const int secondsInDay = 86400;
  static const int daysInWeek = 7;
  static const int daysInMonth = 30;
  static const int daysInYear = 365;

  /// Calculates time ago from a date string.
  // static String timeAgoFromString(String? dateTime) {
  //   if (dateTime.isNullOrEmpty) return '';
  //   try {
  //     final parsedDate = DateTime.parse(dateTime!);
  //     return calculateTimeDifference(parsedDate);
  //   } catch (e) {
  //     // Log error for invalid date formats
  //     printer(e, color: ConsoleColor.redBg);
  //     return '';
  //   }
  // }

  /// Calculates time ago from a DateTime object.
  // static String timeAgoFromDateTime(DateTime? dateTime) {
  //   if (dateTime == null) return '';
  //   return calculateTimeDifference(dateTime);
  // }

  /// Shared logic for calculating time difference.
  // static String calculateTimeDifference(DateTime inputDate) {
  //   final now = DateTime.now();
  //   final difference = now.difference(inputDate);
  //
  //   if (difference.inSeconds < secondsInMinute) {
  //     return AppStrings.now.tr();
  //   } else if (difference.inMinutes < secondsInMinute) {
  //     return _format(difference.inMinutes, AppStrings.minutes.tr());
  //   } else if (difference.inHours < 24) {
  //     return _format(difference.inHours, AppStrings.hours.tr());
  //   } else if (difference.inDays < daysInWeek) {
  //     return _format(difference.inDays, AppStrings.days.tr());
  //   } else if (difference.inDays < daysInMonth) {
  //     return _format(
  //       (difference.inDays / daysInWeek).floor(),
  //       AppStrings.weeks.tr(),
  //     );
  //   } else if (difference.inDays < daysInYear) {
  //     return _format(
  //       (difference.inDays / daysInMonth).floor(),
  //       AppStrings.months.tr(),
  //     );
  //   } else {
  //     return _format(
  //       (difference.inDays / daysInYear).floor(),
  //       AppStrings.years.tr(),
  //     );
  //   }
  // }

  /// Helper function for formatting the output.
  static String _format(int value, String unit) {
    return '$value $unit';
  }
}
