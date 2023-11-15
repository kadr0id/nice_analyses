part of 'sign_in_bloc.dart';

enum SubmissionError { userNotFound, unknown }

class SignInState extends Equatable {
  const SignInState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.submissionError,
  });

  final Email email;
  final Password password;
  final FormzSubmissionStatus status;
  final SubmissionError? submissionError;

  @override
  List<Object?> get props => [
    email,
    password,
    status,
    submissionError,
  ];

  SignInState copyWith({
    Email? email,
    Password? password,
    FormzSubmissionStatus? status,
    bool? obscuredPassword,
    SubmissionError? submissionError,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      submissionError: submissionError ?? this.submissionError,
    );
  }
}
