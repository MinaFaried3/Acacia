import 'package:acacia/app/services/validator/string_validator.dart';
import 'package:acacia/app/shared/extensions/empty_or_null.dart';
import 'package:acacia/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';

abstract class Validator {
  static String? validatePhone(String? phone) {
    final notNullOrEmpty = cannotBeEmpty(phone);
    if (notNullOrEmpty.isNotNull) {
      return notNullOrEmpty;
    }
    //
    // if (phone.length < AppConstants.phoneNumberLength) {
    //   return AppStrings.phoneLengthNotValid.tr();
    // }

    final validPhone = const PhoneNumberSubmitRegexValidator().isValid(phone!);
    if (!validPhone) {
      return AppStrings.phoneInvalid.tr();
    }

    return null;
  }

  static String? validateEmail(String? email) {
    final notNullOrEmpty = cannotBeEmpty(email);
    if (notNullOrEmpty.isNotNull) {
      return notNullOrEmpty;
    }

    final validEmail = const EmailSubmitRegexValidator().isValid(email!);
    if (!validEmail) {
      return AppStrings.emailInvalid.tr();
    }

    return null;
  }

  static String? cannotBeEmpty(String? s) {
    if (s == null || s.isEmpty) {
      return AppStrings.cannotBeEmpty.tr();
    }
    return null;
  }

  static String? validatePassword(
    String? password, {
    bool notShowClearMessage = true,
  }) {
    final notNullOrEmpty = cannotBeEmpty(password);
    if (notNullOrEmpty.isNotNull) {
      return notNullOrEmpty;
    }
    final validPassword = const PasswordSubmitRegexValidator().isValid(
      password!,
    );

    if (notShowClearMessage) {
      if (!validPassword) {
        return AppStrings.passwordInvalid.tr();
      }
    }

    if (!validPassword) {
      //todo show clear message
      return AppStrings.passwordInvalid.tr();
    }

    return null;
  }
}
