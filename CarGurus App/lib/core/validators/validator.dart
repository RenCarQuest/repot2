import '../l10n/extensions/app_localizations_context.dart';
import 'package:flutter/material.dart';

class Validator {
  static String? validateEmail(String? value, BuildContext context) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    if (value == null || value.isEmpty) {
      return context.localization.onboardingEmailError;
    }
    return value.isNotEmpty && !regex.hasMatch(value)
        ? context.localization.onboardingInvalidEmail
        : null;
  }

  static String? validatePassword(String? password, BuildContext context) {
    // Reset error message
    String errorMessage = '';

    if (password == null || password.isEmpty) {
      return context.localization.onboardingPasswordError;
    }

    // Password length greater than 6
    if (password.length < 6) {
      errorMessage += context.localization.onboardingPasswordLengthError;
    }

    // Contains at least one uppercase letter
    if (!password.contains(RegExp(r'[A-Z]'))) {
      errorMessage += context.localization.onboardingPasswordUppercaseError;
    }

    // Contains at least one lowercase letter
    if (!password.contains(RegExp(r'[a-z]'))) {
      errorMessage += context.localization.onboardingPasswordLowercaseError;
    }

    // Contains at least one digit
    if (!password.contains(RegExp(r'[0-9]'))) {
      errorMessage += context.localization.onboardingPasswordDigitError;
    }

    // Contains at least one special character
    if (!password.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))) {
      errorMessage += context.localization.onboardingPasswordCharacterError;
    }

    // If there are no error messages, the password is valid
    return errorMessage.isEmpty ? null : errorMessage;
  }
}
