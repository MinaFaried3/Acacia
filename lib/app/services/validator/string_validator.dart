import 'package:acacia/app/shared/common/constants.dart';
import 'package:acacia/app/shared/common/printer_manager.dart';
import 'package:equatable/equatable.dart';

part 'package:acacia/app/services/validator/regex_validator_types.dart';

sealed class StringValidator extends Equatable {
  bool isValid(String text);

  const StringValidator();
}

sealed class RegexValidator extends StringValidator {
  final String regexSource;

  const RegexValidator({required this.regexSource});

  @override
  bool isValid(String text) {
    try {
      final RegExp regExp = RegExp(regexSource);
      final matches = regExp.allMatches(text);
      for (var match in matches) {
        if (match.start == 0 && match.end == text.length) {
          return true;
        }
      }
      return false;
    } catch (error) {
      printer(error.toString(), color: ConsoleColor.brightRed);
      return false;
    }
  }

  @override
  List<Object> get props => [regexSource];
}
