import 'dart:io';
import 'dart:ui' as ui;

import 'package:acacia/app/shared/common/printer_manager.dart';
import 'package:acacia/app/shared/extensions/empty_or_null.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:stream_transform/stream_transform.dart';

EventTransformer<Event> debounce<Event>(Duration duration) {
  return (Stream<Event> events, Stream<Event> Function(Event) mapper) =>
      events.debounce(duration).switchMap(mapper);
}

void tryCatch({
  required ui.VoidCallback methodToExecute,
  required String errorMessage,
}) {
  try {
    methodToExecute.call();
  } catch (error) {
    PrintManager.print(error, color: ConsoleColor.redBg);
  }
}

Future<Uint8List> getImageFromRawData({
  required String imgPath,
  double? width,
  double? height,
}) async {
  ByteData imageByteData = await rootBundle.load(imgPath);

  Uint8List imageList = imageByteData.buffer.asUint8List();
  ui.Codec imageCodec = await ui.instantiateImageCodec(
    imageList,
    targetWidth: width?.round(),
    targetHeight: height?.round(),
  );

  ui.FrameInfo imageFrameInfo = await imageCodec.getNextFrame();

  ByteData? finalImageByteData = await imageFrameInfo.image.toByteData(
    format: ui.ImageByteFormat.png,
  );
  Uint8List finalImageList = finalImageByteData!.buffer.asUint8List();

  return finalImageList;
}

String formatDateTimeForServer(DateTime dateTime) {
  final DateFormat formatter = DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'");
  PrintManager.print(formatter.format(dateTime.toUtc()));
  return formatter.format(dateTime.toUtc());
}

String formatDateTimeForUx(DateTime? dateTime) {
  if (dateTime == null) return '';
  final DateFormat dateFormatter = DateFormat.yMMMMd().add_jm();

  return dateFormatter.format(dateTime);
}

String formatDate(String dateTimeString) {
  // Parse the input date time string
  DateTime dateTime = DateTime.parse(dateTimeString);

  // Define the date format
  DateFormat formatter = DateFormat.yMMMMd().add_jm();

  // Format the date time
  String formattedDate = formatter.format(dateTime);

  return formattedDate;
}

String getFormattedDateFromString(String dateTimeString) {
  // Parse the input date time string
  DateTime dateTime = DateTime.parse(dateTimeString);

  // Define the date format (e.g., 'Nov 12, Wednesday')
  DateFormat dateFormatter = DateFormat('MMM d, EEEE');

  // Format the date
  String formattedDate = dateFormatter.format(dateTime);

  return formattedDate;
}

String getFormattedTimeFromString(String dateTimeString) {
  // Parse the input date time string
  DateTime dateTime = DateTime.parse(dateTimeString);

  // Define the time format (e.g., '10:00 am')
  DateFormat timeFormatter = DateFormat.jm();

  // Format the time
  String formattedTime = timeFormatter.format(dateTime);

  return formattedTime;
}

String formatBirthdateForUi(String birthdate) {
  final date = DateTime.parse(birthdate);
  return DateFormat('dd, MMM yyyy').format(date);
}

String formatDateToReadableFormat(String? date) => DateFormat(
  'dd, MMM yyyy hh:mm',
).format(DateTime.tryParse(date.fromNullToEmpty) ?? DateTime.now());

String formatDateToReadableFormatDate(String? date) => DateFormat(
  'dd, MMM yyyy',
).format(DateTime.tryParse(date.fromNullToEmpty) ?? DateTime.now());

String formatDateToReadableFormatHour(String? date) => DateFormat(
  'hh:mm',
).format(DateTime.tryParse(date.fromNullToEmpty) ?? DateTime.now());

String timeAgo(String datetimeString) {
  // Parse the datetime string to a DateTime object
  DateTime past = DateTime.parse(datetimeString);
  DateTime now = DateTime.now();

  Duration difference = now.difference(past);

  if (difference.inSeconds < 60) {
    return 'Just now';
  } else if (difference.inMinutes < 60) {
    return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
  } else if (difference.inHours < 24) {
    return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
  } else if (difference.inDays < 30) {
    return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
  } else if (difference.inDays < 365) {
    int months = (difference.inDays / 30).floor();
    return '$months month${months > 1 ? 's' : ''} ago';
  } else {
    int years = (difference.inDays / 365).floor();
    return '$years year${years > 1 ? 's' : ''} ago';
  }
}

// Future<DateTime?> selectDate(
//   BuildContext context,
//   DateTime? initialDate,
// ) async {
//   final DateTime? picked = await showDatePicker(
//     context: context,
//     initialDate: initialDate ?? DateTime(2000, 4),
//     firstDate: DateTime(1950, 1),
//     lastDate: DateTime(2015),
//     builder: (BuildContext context, Widget? child) {
//       return Theme(
//         data: ThemeData(
//           dialogBackgroundColor: ColorsManager.white,
//           dividerColor: ColorsManager.greyBgColor,
//           colorSchemeSeed: ColorsManager.redPrimary,
//           shadowColor: ColorsManager.white,
//         ),
//         child: child!,
//       );
//     },
//   );
//   return picked;
// }

// Future<void> returnToOpenRoute(BuildContext context) async {
//   Routes openRoute = await getIt<AppPreferences>().getOpeningRoutePath();
//   if (context.mounted) {
//     context.pushNamedAndRemoveUntil(openRoute.path);
//   }
// }

bool isTablet(BuildContext context) {
  return MediaQuery.of(context).size.shortestSide >=
      600; // Example threshold for tablets
}

String formatHourAndDateToISO8601(DateTime date, int hour) {
  // Create a new DateTime object with the specified hour, assuming UTC
  DateTime formattedDate = DateTime.utc(date.year, date.month, date.day, hour);

  // Return the ISO 8601 string in the required format (e.g., '2024-11-26T21:00:00.000Z')
  return "${formattedDate.toIso8601String().split('.').first}.${formattedDate.microsecond.toString().padLeft(6, '0')}Z";
}

String formatTimeRange({
  required String startTimeString,
  required String endTimeString,
}) {
  // Parse start and end times in ISO 8601 UTC format
  DateTime startTime = DateTime.parse(startTimeString).toUtc();
  DateTime endTime = DateTime.parse(endTimeString).toUtc();

  // Define formats for time and date
  final timeFormat = DateFormat('h a'); // Example: '10 AM'
  final dateFormat = DateFormat('d MMM, yyyy'); // Example: '26 Nov, 2024'

  // Format the times and date
  String startTimeFormatted = timeFormat.format(startTime);
  String endTimeFormatted = timeFormat.format(endTime);
  String dateFormatted = dateFormat.format(startTime);

  // Handle same-day or different-day ranges
  if (startTime.day == endTime.day && startTime.year == endTime.year) {
    return '$startTimeFormatted - $endTimeFormatted, $dateFormatted';
  } else {
    // If the range spans multiple days
    String endDateFormatted = dateFormat.format(endTime);
    return '$startTimeFormatted, $dateFormatted - $endTimeFormatted, $endDateFormatted';
  }
}

// Extract and parse the hour part, defaulting to 0 on failure
int getHourIntFromString(String? hour) =>
    int.tryParse(hour?.split(':')[0] ?? '0') ?? 0;

bool isFutureDate(String? dateString) {
  if (dateString == null || dateString.isEmpty) {
    return false;
  }

  try {
    // Parse the date string as UTC
    DateTime inputDate = DateTime.parse(dateString).toUtc();

    // Compare with the current UTC time
    return inputDate.isAfter(DateTime.now().toUtc());
  } catch (e) {
    // AppLogger().error('Invalid date string: $dateString');
    return false;
  }
}

Future<ui.Image> getImageDimensions(File imageFile) async {
  final data = await imageFile.readAsBytes();
  final uiImage = await decodeImageFromList(data);
  return uiImage; // Contains width and height
}
