import 'dart:developer';

import 'package:acacia/app/config/app_mode.dart';
import 'package:flutter/material.dart';

enum ConsoleColor {
  reset('\u001b[0m'),
  black('\u001b[30m'),
  red('\u001b[31m'),
  green('\u001b[32m'),
  yellow('\u001b[33m'),
  blue('\u001b[34m'),
  magenta('\u001b[35m'),
  cyan('\u001b[36m'),
  white('\u001b[37m'),
  brightBlack('\u001b[90m'),
  brightRed('\u001b[91m'),
  brightGreen('\u001b[92m'),
  brightYellow('\u001b[93m'),
  brightBlue('\u001b[94m'),
  brightMagenta('\u001b[95m'),
  brightCyan('\u001b[96m'),
  brightWhite('\u001b[97m'),
  blackBg('\u001b[40m'),
  redBg('\u001b[41m'),
  greenBg('\u001b[42m'),
  yellowBg('\u001b[43m'),
  blueBg('\u001b[44m'),
  magentaBg('\u001b[45m'),
  cyanBg('\u001b[46m'),
  whiteBg('\u001b[47m'),
  brightBlackBg('\u001b[100m'),
  brightRedBg('\u001b[101m'),
  brightGreenBg('\u001b[102m'),
  brightYellowBg('\u001b[103m'),
  brightBlueBg('\u001b[104m'),
  brightMagentaBg('\u001b[105m'),
  brightCyanBg('\u001b[106m'),
  brightWhiteBg('\u001b[107m');

  final String colorCode;

  const ConsoleColor(this.colorCode);
}

class PrintManager {
  static void print(
    dynamic object, {
    ConsoleColor color = ConsoleColor.magenta,
    bool useLog = false,
  }) {
    if (AppMode.prodReleaseMode) return;

    final colorCode = color.colorCode;

    String printedString =
        '$colorCode${object.toString()}${ConsoleColor.reset.colorCode}';

    if (useLog) {
      log(printedString);
      return;
    }

    debugPrint(printedString);
  }

  static void printHint(dynamic object) {
    print(object, color: ConsoleColor.brightBlack);
  }
}
