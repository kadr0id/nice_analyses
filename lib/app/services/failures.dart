/// Failure thrown if any authentication method fails.
class AuthenticationFailure implements Exception {
  /// Default constructor
  AuthenticationFailure(this.originalException);

  /// Original [Exception]
  final Object originalException;

  @override
  String toString() => '$originalException';
}

/// Failure thrown if sign in fails.
class SignInFailure extends AuthenticationFailure {
  /// Default constructor
  SignInFailure(Object originalException) : super(originalException);
}

/// Failure thrown if sign in fails because there is not user found.
class UserNotFoundFailure extends SignInFailure {
  /// Default constructor
  UserNotFoundFailure(Object originalException) : super(originalException);
}

/// Failure thrown if sign up fails.
class SignUpFailure extends AuthenticationFailure {
  /// Default constructor
  SignUpFailure(Object originalException) : super(originalException);
}

/// Failure thrown if sign up fails because user already exists.
class UserAlreadyExistsFailure extends SignUpFailure {
  /// Default constructor
  UserAlreadyExistsFailure(Object originalException) : super(originalException);
}

/// Failure thrown if confirm sign up fails.
class ConfirmSignUpFailure extends AuthenticationFailure {
  /// Default constructor
  ConfirmSignUpFailure(Object originalException) : super(originalException);
}

/// Failure thrown when change password fails due to a
/// submitted invalid current password.
class InvalidCurrentPasswordFailure extends AuthenticationFailure {
  /// Default constructor
  InvalidCurrentPasswordFailure(Object originalException)
      : super(originalException);
}

/// Failure thrown when change password fails
class ChangePasswordFailure extends AuthenticationFailure {
  /// Default constructor
  ChangePasswordFailure(Object originalException) : super(originalException);
}

/// Failure thrown if reset password fails.
class ResetPasswordFailure extends AuthenticationFailure {
  /// Default constructor
  ResetPasswordFailure(Object originalException) : super(originalException);
}

/// Failure thrown if confirm reset password fails.
class ConfirmResetPasswordFailure extends AuthenticationFailure {
  /// Default constructor
  ConfirmResetPasswordFailure(Object originalException)
      : super(originalException);
}

/// Failure thrown if sign out fails.
class SignOutFailure extends AuthenticationFailure {
  /// Default constructor
  SignOutFailure(Object originalException) : super(originalException);
}
