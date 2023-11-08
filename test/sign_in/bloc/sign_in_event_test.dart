// ignore_for_file: prefer_const_constructors
import 'package:flutter_test/flutter_test.dart';
import 'package:nice_analyses/sign_in/bloc/sign_in_bloc.dart';

void main() {
  group('SignInEvent', () {
    group('SignInEmailChanged', () {
      test('supports value comparisons', () {
        expect(
          SignInEmailChanged('test@gmail.com'),
          SignInEmailChanged('test@gmail.com'),
        );
        expect(
          SignInEmailChanged(''),
          isNot(SignInEmailChanged('test@gmail.com')),
        );
      });
    });

    group('SignInPasswordChanged', () {
      test('supports value comparisons', () {
        expect(SignInPasswordChanged('pwd'), SignInPasswordChanged('pwd'));
        expect(
          SignInPasswordChanged(''),
          isNot(SignInPasswordChanged('pwd')),
        );
      });
    });

    group('SignInCredentialsSubmitted', () {
      test('supports value comparisons', () {
        expect(
          SignInCredentialsSubmitted(),
          SignInCredentialsSubmitted(),
        );
      });
    });
  });
}
