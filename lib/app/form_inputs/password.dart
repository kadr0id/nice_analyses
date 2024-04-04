import 'package:nice_analyses/app/form_inputs/forms_input.dart';

/// Password Form Input Validation Error
enum PasswordValidationError {
  /// Password is invalid (generic validation error)
  invalid,

  /// Password is empty
  empty,
}

/// {@template password}
/// Reusable password form input.
/// {@endtemplate}
class Password extends FormzInput<String, PasswordValidationError> {
  /// {@macro password}
  const Password.pure() : super.pure('');

  /// {@macro password}
  const Password.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordValidationError? validator(String value) {
    if (value.isNotEmpty) {
      return hasMinLength(value, 8) && hasMaxLength(value, 99)
          ? null
          : PasswordValidationError.invalid;
    }
    return PasswordValidationError.empty;
  }
}
