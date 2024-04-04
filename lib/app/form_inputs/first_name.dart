import 'package:nice_analyses/app/form_inputs/forms_input.dart';

/// FirstName Form Input Validation Error
enum FirstNameValidationError {
  /// FirstName is invalid (generic validation error)
  invalid,
}

/// {@template first_name}
/// Reusable first_name form input.
/// {@endtemplate}
class FirstName extends FormzInput<String, FirstNameValidationError> {
  /// {@macro first_name}
  const FirstName.pure() : super.pure('');

  /// {@macro first_name}
  const FirstName.dirty([String value = '']) : super.dirty(value);

  @override
  FirstNameValidationError? validator(String value) {
    if (value.isEmpty) return null;
    return firstNameRegExp.hasMatch(value)
        ? null
        : FirstNameValidationError.invalid;
  }
}