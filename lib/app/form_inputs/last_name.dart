import 'package:nice_analyses/app/form_inputs/forms_input.dart';

/// LastName Form Input Validation Error
enum LastNameValidationError {
  /// LastName is invalid (generic validation error)
  invalid,
}

/// {@template last_name}
/// Reusable last_name form input.
/// {@endtemplate}
class LastName extends FormzInput<String, LastNameValidationError> {
  /// {@macro last_name}
  const LastName.pure() : super.pure('');

  /// {@macro last_name}
  const LastName.dirty([String value = '']) : super.dirty(value);

  @override
  LastNameValidationError? validator(String value) {
    if (value.isEmpty) return null;
    return lastNameRegExp.hasMatch(value)
        ? null
        : LastNameValidationError.invalid;
  }
}
