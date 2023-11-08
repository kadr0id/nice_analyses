import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../app/form_inputs/email.dart';
import '../../app/form_inputs/password.dart';
import '../../app/services/auth_user.dart';
import '../../app/services/failures.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc(this._authService) : super(const SignInState()) {
    on<SignInEmailChanged>(_emailChanged);
    on<SignInPasswordChanged>(_passwordChanged);
    on<SignInCredentialsSubmitted>(_credentialsSubmitted);
  }

  final AuthService _authService;

  void _emailChanged(
    SignInEmailChanged event,
    Emitter<SignInState> emit,
  ) {
    final email = Email.dirty(event.email);
    emit(
      state.copyWith(
        email: email,
        status: (Formz.validate([email, state.password])
            ? FormzSubmissionStatus.success
            : FormzSubmissionStatus.failure),
      ),
    );
  }

  void _passwordChanged(
    SignInPasswordChanged event,
    Emitter<SignInState> emit,
  ) {
    final password = Password.dirty(event.password);
    emit(
      state.copyWith(
        password: password,
        status: (Formz.validate([state.email, password])
            ? FormzSubmissionStatus.success
            : FormzSubmissionStatus.failure),
      ),
    );
  }

  Future<void> _credentialsSubmitted(
    SignInCredentialsSubmitted event,
    Emitter<SignInState> emit,
  ) async {
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);
    emit(
      state.copyWith(
        email: email,
        password: password,
        status: (Formz.validate([email, password])
            ? FormzSubmissionStatus.success
            : FormzSubmissionStatus.failure),
      ),
    );

    if (!state.status.isSuccess) return;

    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await _authService.signInWithEmailAndPassword(
        email: state.email.value,
        password: state.password.value,
      );
    } on UserNotFoundFailure catch (_) {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          submissionError: SubmissionError.userNotFound,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          submissionError: SubmissionError.unknown,
        ),
      );
    }
  }
}
