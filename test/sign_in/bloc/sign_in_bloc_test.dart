// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nice_analyses/app/form_inputs/email.dart';
import 'package:nice_analyses/app/form_inputs/password.dart';
import 'package:nice_analyses/app/models/user_model.dart';
import 'package:nice_analyses/app/services/auth_user.dart';
import 'package:nice_analyses/app/services/failures.dart';
import 'package:nice_analyses/sign_in/bloc/sign_in_bloc.dart';

class MockAuthenticationRepository extends Mock
    implements AuthService {}

void main() {
  const invalidEmailString = 'invalid';
  const invalidEmail = Email.dirty(invalidEmailString);

  const validEmailString = 'test@gmail.com';
  const validEmail = Email.dirty(validEmailString);

  const invalidPasswordString = 'invalid';
  const invalidPassword = Password.dirty(invalidPasswordString);

  const validPasswordString = 't0pS3cret1234';
  const validPassword = Password.dirty(validPasswordString);

  group('SignInBloc', () {
    late AuthService authService;

    setUp(() {
      authService = MockAuthenticationRepository();
      when(
            () => authService.signInWithEmailAndPassword(
          email: any(named: 'email'),
          password: any(named: 'password'),
        ),
      ).thenAnswer((_) => Future<NiceUser>.value());
    });

    test('initial state is SignInState', () {
      expect(SignInBloc(authService).state, SignInState());
    });

    group('SignInEmailChanged', () {
      blocTest<SignInBloc, SignInState>(
        'emits [invalid] when email/password are invalid',
        build: () => SignInBloc(authService),
        act: (bloc) => bloc.add(SignInEmailChanged(invalidEmailString)),
        expect: () => const <SignInState>[
          SignInState(email: invalidEmail, status: FormzSubmissionStatus.failure),
        ],
      );

      blocTest<SignInBloc, SignInState>(
        'emits [valid] when email/password are valid',
        build: () => SignInBloc(authService),
        seed: () => SignInState(password: validPassword),
        act: (bloc) => bloc.add(SignInEmailChanged(validEmailString)),
        expect: () => const <SignInState>[
          SignInState(
            email: validEmail,
            password: validPassword,
            status: FormzSubmissionStatus.success,
          ),
        ],
      );
    });

    group('SignInPasswordChanged', () {
      blocTest<SignInBloc, SignInState>(
        'emits [invalid] when email/password are invalid',
        build: () => SignInBloc(authService),
        act: (bloc) => bloc.add(SignInPasswordChanged(invalidPasswordString)),
        expect: () => const <SignInState>[
          SignInState(
            password: invalidPassword,
            status: FormzSubmissionStatus.failure,
          ),
        ],
      );

      blocTest<SignInBloc, SignInState>(
        'emits [valid] when email/password are valid',
        build: () => SignInBloc(authService),
        seed: () => SignInState(email: validEmail),
        act: (bloc) => bloc.add(SignInPasswordChanged(validPasswordString)),
        expect: () => const <SignInState>[
          SignInState(
            email: validEmail,
            password: validPassword,
            status: FormzSubmissionStatus.success,
          ),
        ],
      );
    });

    group('SignInCredentialsSubmitted', () {
      blocTest<SignInBloc, SignInState>(
        'validates data and does nothing when status is not validated',
        build: () => SignInBloc(authService),
        act: (bloc) => bloc.add(SignInCredentialsSubmitted()),
        expect: () => <SignInState>[
          SignInState(
            email: Email.dirty(),
            password: Password.dirty(),
            status: FormzSubmissionStatus.failure,
          ),
        ],
      );

      blocTest<SignInBloc, SignInState>(
        'calls signIn with correct email/password',
        build: () => SignInBloc(authService),
        seed: () => SignInState(
          status: FormzSubmissionStatus.success,
          email: validEmail,
          password: validPassword,
        ),
        act: (bloc) => bloc.add(SignInCredentialsSubmitted()),
        verify: (_) {
          verify(
                () => authService.signInWithEmailAndPassword(
              email: validEmailString,
              password: validPasswordString,
            ),
          ).called(1);
        },
      );

      blocTest<SignInBloc, SignInState>(
        'emits [submissionInProgress, submissionSuccess] '
            'when signIn succeeds',
        build: () => SignInBloc(authService),
        seed: () => SignInState(
          status: FormzSubmissionStatus.success,
          email: validEmail,
          password: validPassword,
        ),
        act: (bloc) => bloc.add(SignInCredentialsSubmitted()),
        expect: () => const <SignInState>[
          SignInState(
            status: FormzSubmissionStatus.inProgress,
            email: validEmail,
            password: validPassword,
          ),
          SignInState(
            status: FormzSubmissionStatus.success,
            email: validEmail,
            password: validPassword,
          )
        ],
      );

      blocTest<SignInBloc, SignInState>(
        'emits [submissionInProgress, submissionFailure] '
            'SubmissionError.unknown'
            'when signIn fails with unknown error',
        build: () {
          when(
                () => authService.signInWithEmailAndPassword(
              email: any(named: 'email'),
              password: any(named: 'password'),
            ),
          ).thenThrow(Exception('oops'));
          return SignInBloc(authService);
        },
        seed: () => SignInState(
          status: FormzSubmissionStatus.success,
          email: validEmail,
          password: validPassword,
        ),
        act: (bloc) => bloc.add(SignInCredentialsSubmitted()),
        expect: () => const <SignInState>[
          SignInState(
            status: FormzSubmissionStatus.inProgress,
            email: validEmail,
            password: validPassword,
          ),
          SignInState(
            status: FormzSubmissionStatus.failure,
            email: validEmail,
            password: validPassword,
            submissionError: SubmissionError.unknown,
          )
        ],
      );

      blocTest<SignInBloc, SignInState>(
        'emits [submissionInProgress, submissionFailure] '
            'SubmissionError.userNotFound'
            'when signIn throws UserNotFoundFailure',
        build: () {
          when(
                () => authService.signInWithEmailAndPassword(
              email: any(named: 'email'),
              password: any(named: 'password'),
            ),
          ).thenThrow(UserNotFoundFailure(''));
          return SignInBloc(authService);
        },
        seed: () => SignInState(
          status: FormzSubmissionStatus.success,
          email: validEmail,
          password: validPassword,
        ),
        act: (bloc) => bloc.add(SignInCredentialsSubmitted()),
        expect: () => const <SignInState>[
          SignInState(
            status: FormzSubmissionStatus.inProgress,
            email: validEmail,
            password: validPassword,
          ),
          SignInState(
            status: FormzSubmissionStatus.failure,
            email: validEmail,
            password: validPassword,
            submissionError: SubmissionError.userNotFound,
          )
        ],
      );
    });
  });
}
