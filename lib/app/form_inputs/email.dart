import 'package:nice_analyses/app/form_inputs/forms_input.dart';

/// Email Form Input Validation Error
enum EmailValidationError {
  /// Email is invalid (generic validation error)
  invalid,

  /// Email is empty
  empty,
}

/// {@template email}
/// Reusable email form input.
/// {@endtemplate}
class Email extends FormzInput<String, EmailValidationError> {
  /// {@macro email}
  const Email.pure() : super.pure('');

  /// {@macro email}
  const Email.dirty([String value = '']) : super.dirty(value);

  @override
  EmailValidationError? validator(String value) {
    if (value.isNotEmpty) {
      return emailRegExp.hasMatch(value) ? null : EmailValidationError.invalid;
    }
    return EmailValidationError.empty;
  }
}
