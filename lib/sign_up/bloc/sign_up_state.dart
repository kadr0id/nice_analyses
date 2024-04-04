part of 'sign_up_bloc.dart';

enum FormValidationError {
  wrongEmail,
  wrongPassword,
  notMatchingPasswords,
  wrongFirstName,
  wrongLastName
}

enum SubmissionError { userExistsAlready, somethingWentWrong }

enum ConfirmEmailPopupState { initial, open }

class SignUpState extends Equatable {
  const SignUpState({
    this.firstName = const FirstName.pure(),
    this.lastName = const LastName.pure(),
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.confirmPassword = const ConfirmPassword.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.submissionError,
    this.confirmEmailPopupState = ConfirmEmailPopupState.initial,
  });

  final FirstName firstName;
  final LastName lastName;
  final Email email;
  final Password password;
  final ConfirmPassword confirmPassword;
  final FormzSubmissionStatus status;
  final SubmissionError? submissionError;
  final ConfirmEmailPopupState confirmEmailPopupState;

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        email,
        password,
        confirmPassword,
        status,
        submissionError,
        confirmEmailPopupState,
      ];

  SignUpState copyWith({
    FirstName? firstName,
    LastName? lastName,
    Email? email,
    Password? password,
    bool? obscuredPassword,
    ConfirmPassword? confirmPassword,
    bool? obscuredConfirmPassword,
    FormzSubmissionStatus? status,
    SubmissionError? submissionError,
    ConfirmEmailPopupState? confirmEmailPopupState,
  }) {
    return SignUpState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      status: status ?? this.status,
      submissionError: submissionError ?? this.submissionError,
      confirmEmailPopupState:
          confirmEmailPopupState ?? this.confirmEmailPopupState,
    );
  }
}
