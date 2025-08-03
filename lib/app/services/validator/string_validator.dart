// import 'package:speed_service/app/shared/common/common_libs.dart';
//
// part 'package:speed_service/app/services/validator/regex_validator_types.dart';
//
// sealed class StringValidator extends Equatable {
//   bool isValid(String text);
//
//   const StringValidator();
// }
//
// sealed class RegexValidator extends StringValidator {
//   final String regexSource;
//
//   const RegexValidator({required this.regexSource});
//
//   @override
//   bool isValid(String text) {
//     try {
//       final RegExp regExp = RegExp(regexSource);
//       final matches = regExp.allMatches(text);
//       for (var match in matches) {
//         if (match.start == 0 && match.end == text.length) {
//           return true;
//         }
//       }
//       return false;
//     } catch (error) {
//       PrintManager.print(error.toString(), color: ConsoleColor.brightRed);
//       return false;
//     }
//   }
//
//   @override
//   List<Object> get props => [regexSource];
// }
