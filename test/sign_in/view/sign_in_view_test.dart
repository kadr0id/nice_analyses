// ignore_for_file: prefer_const_constructors
import 'package:bloc_test/bloc_test.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:mockingjay/mockingjay.dart';
import 'package:nice_analyses/app/form_inputs/email.dart';
import 'package:nice_analyses/app/form_inputs/password.dart';
import 'package:nice_analyses/sign_in/bloc/sign_in_bloc.dart';
import 'package:nice_analyses/sign_in/view/sign_in_view.dart';


class MockSignInBloc extends MockBloc<SignInEvent, SignInState>
    implements SignInBloc {}

class FakeSignInEvent extends Fake implements SignInEvent {}

class FakeSignInState extends Fake implements SignInState {}

class MockEmail extends Mock implements Email {}

class MockPassword extends Mock implements Password {}


void main() {
  const signInButtonKey = Key('signInView_signIn_textButton');
  const emailInputKey = Key('signInView_emailInput_textField');
  const passwordInputKey = Key('signInView_passwordInput_textField');
  const forgotPasswordButtonKey = Key('signInView_forgotPassword_textButton');
  const unknownFailureSnackBarKey = Key('signInView_failure_unknown_snackBar');
  const userNotFoundFailureSnackBarKey =
  Key('signInView_failure_userNotFound_snackBar');
  const snackBarSuccessKey = Key('signInView_success_snackBar');

  const testEmail = 'test@gmail.com';
  const testPassword = 'testPassw0rd123';

  const email = Email.dirty(testEmail);
  const password = Password.dirty(testPassword);

  group('SignInView', () {
    late SignInBloc signInBloc;

    setUpAll(() {
      registerFallbackValue(FakeSignInEvent());
      registerFallbackValue(FakeSignInState());
    });

    setUp(() {
      signInBloc = MockSignInBloc();
      when(() => signInBloc.state).thenReturn(const SignInState());
    });

    group('adds', () {
      testWidgets('SignInEmailChanged when email changes', (tester) async {
        await tester.pumpSignInView(
          signInBloc: signInBloc,
        );

        await tester.enterText(find.byKey(emailInputKey), testEmail);
        verify(() => signInBloc.add(const SignInEmailChanged(testEmail)))
            .called(1);
      });



      testWidgets('SignInCredentialsSubmitted when sign in button is pressed',
              (tester) async {
            when(() => signInBloc.state).thenReturn(
              const SignInState(
                status: FormzSubmissionStatus.success,
                email: email,
                password: password,
              ),
            );
            await tester.pumpSignInView(
              signInBloc: signInBloc,
            );
            await tester.ensureVisible(find.byKey(signInButtonKey));
            await tester.tap(find.byKey(signInButtonKey));
            verify(() => signInBloc.add(SignInCredentialsSubmitted())).called(1);
          });
    });

    group('renders', () {
      testWidgets(
          'AuthenticationFailure SnackBar when submission fails '
              'with unknown error', (tester) async {
        whenListen(
          signInBloc,
          Stream.fromIterable(const <SignInState>[
            SignInState(status: FormzSubmissionStatus.inProgress,),
            SignInState(
              status: FormzSubmissionStatus.failure,
              submissionError: SubmissionError.unknown,
            ),
          ]),
        );
        await tester.pumpSignInView(
          signInBloc: signInBloc,
        );
        await tester.pump();
        expect(find.byKey(unknownFailureSnackBarKey), findsOneWidget);
      });

      testWidgets(
          'AuthenticationFailure SnackBar when submission fails '
              'with user not found error', (tester) async {
        whenListen(
          signInBloc,
          Stream.fromIterable(const <SignInState>[
            SignInState(status: FormzSubmissionStatus.inProgress),
            SignInState(
              status: FormzSubmissionStatus.failure,
              submissionError: SubmissionError.userNotFound,
            ),
          ]),
        );
        await tester.pumpSignInView(
          signInBloc: signInBloc,
        );
        await tester.pump();
        expect(find.byKey(userNotFoundFailureSnackBarKey), findsOneWidget);
      });

      testWidgets('AuthenticationSuccess SnackBar when submission successes',
              (tester) async {
            whenListen(
              signInBloc,
              Stream.fromIterable(const <SignInState>[
                SignInState(status: FormzSubmissionStatus.inProgress),
                SignInState(status: FormzSubmissionStatus.success),
              ]),
            );
            await tester.pumpSignInView(
              signInBloc: signInBloc,
            );
            await tester.pump();
            expect(find.byKey(snackBarSuccessKey), findsOneWidget);
          });

      testWidgets('empty email error text when email is invalid',
              (tester) async {
            final email = MockEmail();
            when(() => email.isValid).thenReturn(false);
            when(() => email.isNotValid).thenReturn(true);
            when(() => email.error).thenReturn(EmailValidationError.empty);
            when(() => signInBloc.state).thenReturn(
              SignInState(email: email, password: password),
            );
            await tester.pumpSignInView(
              signInBloc: signInBloc,
            );
            expect(
              find.text('Please enter your email address'),
              findsOneWidget,
            );
          });

      testWidgets('invalid email error text when email is invalid',
              (tester) async {
            final email = MockEmail();
            when(() => email.isValid).thenReturn(false);
            when(() => email.isNotValid).thenReturn(true);
            when(() => email.error).thenReturn(EmailValidationError.invalid);
            when(() => signInBloc.state).thenReturn(
              SignInState(email: email, password: password),
            );
            await tester.pumpSignInView(
              signInBloc: signInBloc,
            );
            expect(
              find.text('Please enter email address in a valid format'),
              findsOneWidget,
            );
          });

      testWidgets('empty password error text when password is invalid',
              (tester) async {
            final password = MockPassword();
            when(() => password.isNotValid).thenReturn(true);
            when(() => password.error).thenReturn(PasswordValidationError.empty);
            when(() => signInBloc.state)
                .thenReturn(SignInState(password: password));
            await tester.pumpSignInView(
              signInBloc: signInBloc,
            );
            expect(find.text('Please enter a password'), findsOneWidget);
          });

      testWidgets('invalid password error text when password is invalid',
              (tester) async {
            final password = MockPassword();
            when(() => password.isNotValid).thenReturn(true);
            when(() => password.error).thenReturn(PasswordValidationError.invalid);
            when(() => signInBloc.state)
                .thenReturn(SignInState(password: password));
            await tester.pumpSignInView(
              signInBloc: signInBloc,
            );
            expect(find.text('Invalid password'), findsOneWidget);
          });

    });

    group('navigates', () {
      testWidgets('to Sign Up page when tapped on the button', (tester) async {
        final navigator = MockNavigator();
        when(() => navigator.pushReplacement(any())).thenAnswer((_) async {
          return null;
        });

        await tester.pumpSignInView(
          signInBloc: signInBloc,
          navigator: navigator,
        );
        await tester
            .tap(find.byKey(const Key('signInView_goToSignUp_textButton')));
        await tester.pumpAndSettle();

        verify(
              () => navigator
              .pushReplacement(any(that: isRoute<void>(whereName: equals('/sign-up')))),
        ).called(1);
      });
    });
  });
}

extension on WidgetTester {
  Future<void> pumpSignInView({
    MockNavigator? navigator,
    required SignInBloc signInBloc,
  }) {
    return pumpApp(
      MockNavigatorProvider(
        navigator: navigator ?? MockNavigator(),
        child: MultiBlocProvider(
          providers: [
            BlocProvider.value(value: signInBloc),
          ],
          child: SignInView(),
        ),
      ),
    );
  }
}
