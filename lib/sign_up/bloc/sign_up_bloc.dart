import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nice_analyses/app/form_inputs/forms_input.dart';

import 'package:nice_analyses/app/services/auth_user.dart';
import 'package:nice_analyses/app/services/failures.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc(this._authenticationRepository) : super(const SignUpState()) {
    on<SignUpFirstNameChanged>(_firstNameChanged);
    on<SignUpLastNameChanged>(_lastNameChanged);
    on<SignUpEmailChanged>(_emailChanged);
    on<SignUpPasswordChanged>(_passwordChanged);
    on<SignUpConfirmPasswordChanged>(_confirmPasswordChanged);
    on<SignUpSubmitted>(_signupSubmitted);
    on<SignUpPressed>(_signUpPressed);
    on<SignUpDialogCancelled>(_signUpDialogCancelled);
  }

  final AuthService _authenticationRepository;

  void _firstNameChanged(
    SignUpFirstNameChanged event,
    Emitter<SignUpState> emit,
  ) {
    final firstName = FirstName.dirty(event.firstName);
    emit(
      state.copyWith(
        firstName: firstName,
      ),
    );
  }

  void _lastNameChanged(
    SignUpLastNameChanged event,
    Emitter<SignUpState> emit,
  ) {
    final lastName = LastName.dirty(event.lastName);
    emit(
      state.copyWith(
        lastName: lastName,
      ),
    );
  }

  void _emailChanged(
    SignUpEmailChanged event,
    Emitter<SignUpState> emit,
  ) {
    final email = Email.dirty(event.email);
    emit(
      state.copyWith(
          email: email,
          status: Formz.validate(
            [
              email,
              state.password,
              state.confirmPassword,
            ],
          )
              ? FormzSubmissionStatus.success
              : FormzSubmissionStatus.failure),
    );
  }

  void _passwordChanged(
    SignUpPasswordChanged event,
    Emitter<SignUpState> emit,
  ) {
    final password = Password.dirty(event.password);
    ConfirmPassword? confirmPassword;
    if (state.confirmPassword.value.isNotEmpty) {
      confirmPassword = ConfirmPassword.dirty(
        password: password,
        value: state.confirmPassword.value,
      );
    }
    emit(
      state.copyWith(
          password: password,
          confirmPassword: confirmPassword ?? state.confirmPassword,
          status: Formz.validate([
            password,
            confirmPassword ?? state.confirmPassword,
            state.email,
          ])
              ? FormzSubmissionStatus.success
              : FormzSubmissionStatus.failure),
    );
  }

  void _confirmPasswordChanged(
    SignUpConfirmPasswordChanged event,
    Emitter<SignUpState> emit,
  ) {
    final confirmPassword = ConfirmPassword.dirty(
      password: state.password,
      value: event.confirmPassword,
    );
    emit(
      state.copyWith(
          confirmPassword: confirmPassword,
          status: Formz.validate(
            [
              confirmPassword,
              state.email,
              state.password,
            ],
          )
              ? FormzSubmissionStatus.success
              : FormzSubmissionStatus.failure),
    );
  }

  void _signUpPressed(
    SignUpPressed event,
    Emitter<SignUpState> emit,
  ) {
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);
    final confirmPassword = ConfirmPassword.dirty(
      password: password,
      value: state.confirmPassword.value,
    );
    emit(
      state.copyWith(
          email: email,
          password: password,
          confirmPassword: confirmPassword,
          status: Formz.validate(
            [
              confirmPassword,
              email,
              password,
            ],
          )
              ? FormzSubmissionStatus.success
              : FormzSubmissionStatus.failure),
    );
    if (state.status.isSuccess) {
      emit(
        state.copyWith(
          confirmEmailPopupState: ConfirmEmailPopupState.open,
        ),
      );
    }
  }

  void _signUpDialogCancelled(
    SignUpDialogCancelled event,
    Emitter<SignUpState> emit,
  ) {
    emit(
      state.copyWith(
        confirmEmailPopupState: ConfirmEmailPopupState.initial,
      ),
    );
  }

  Future<void> _signupSubmitted(
    SignUpSubmitted event,
    Emitter<SignUpState> emit,
  ) async {
    emit(
      state.copyWith(
        status: FormzSubmissionStatus.inProgress,
        confirmEmailPopupState: ConfirmEmailPopupState.initial,
      ),
    );
    try {
      await _authenticationRepository.signInWithEmailAndPassword(
        email: state.email.value,
        password: state.password.value,
        // lastName: state.lastName.value.trim(),
        // firstName: state.firstName.value.trim(),
      );
      await _authenticationRepository.registerWithEmailAndPassword(
        email: state.email.value,
        password: state.password.value,
      );
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } on UserAlreadyExistsFailure catch (_) {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          submissionError: SubmissionError.userExistsAlready,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          submissionError: SubmissionError.somethingWentWrong,
        ),
      );
    }
  }
}
