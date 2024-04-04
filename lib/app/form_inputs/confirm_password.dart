import 'package:nice_analyses/app/form_inputs/forms_input.dart';

/// Confirm Password Form Input Validation Error.
enum ConfirmPasswordValidationError {
  /// Confirm password is empty.
  empty,

  /// Confirm password does not match the original password.
  noMatch
}

/// {@template confirm_password}
/// Reusable confirm password form input.
/// {@endtemplate}
class ConfirmPassword
    extends FormzInput<String, ConfirmPasswordValidationError> {
  /// {@macro confirm_password}
  const ConfirmPassword.pure()
      : password = const Password.pure(),
        super.pure('');

  /// {@macro confirm_password}
  const ConfirmPassword.dirty({required this.password, String value = ''})
      : super.dirty(value);

  /// Original password to match the confirm password against.
  final Password password;

  @override
  ConfirmPasswordValidationError? validator(String value) {
    if (value.isEmpty) return ConfirmPasswordValidationError.empty;

    if (value != password.value) {
      return ConfirmPasswordValidationError.noMatch;
    }

    return null;
  }
}
