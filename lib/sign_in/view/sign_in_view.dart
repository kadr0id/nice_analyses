import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nice_analyses/app/nice_ui/widgets/primary_action_button.dart';
import 'package:nice_analyses/main_analyses/view/main_analyses_page.dart';
import 'package:nice_analyses/sign_in/sign_in.dart';
import '../../app/form_inputs/forms_input.dart';
import '../../app/nice_ui/typography/nice_spacing.dart';
import '../../app/nice_ui/widgets/nice_password_text_field.dart';
import '../../app/nice_ui/widgets/nice_text_field.dart';
import '../../app/nice_ui/widgets/registration_header.dart';
import '../../app/nice_ui/widgets/scrollable_column.dart';
import '../../app/nice_ui/widgets/text_link_button.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status.isSuccess) {
          //   AbraSnackBar.message(
          //     l10n.authenticationSuccess,
          //     key: const Key('signInView_success_snackBar'),
          //   ).show(context: context);
          //   Navigator.of(context).pop();
          // }
          if (state.status.isFailure) {
            if (state.submissionError == SubmissionError.userNotFound) {
              // AbraSnackBar.error(
              //   l10n.userNotFoundFailure,
              //   key: const Key('signInView_failure_userNotFound_snackBar'),
              // ).show(context: context);
            } else if (state.submissionError == SubmissionError.unknown) {
              // AbraSnackBar.error(
              //   l10n.authenticationFailure,
              //   key: const Key('signInView_failure_unknown_snackBar'),
              // ).show(context: context);
            }
          }
        }
      },
      child: Stack(
        children: [
          ScrollableColumn(
            children: [
              const Spacer(flex: 1),
              const RegistrationHeader(title: 'Hello Nice analyses!'),
              const Spacer(flex: 1),
              const _EmailInput(),
              const SizedBox(height: NiceSpacing.xs),
              const _PasswordInput(),
              const Align(
                alignment: Alignment.centerRight,
                child: _ForgotPasswordButton(),
              ),
              const Spacer(flex: 5),
              _SignInButton(),
              const _GoToSignUp(),
              const Spacer(),
              const SizedBox(height: NiceSpacing.sm),
            ],
          ),
        ],
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EmailValidationError email = EmailValidationError.empty;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: NiceSpacing.lg,
      ),
      child: NiceTextField(
        key: const Key('signInView_emailInput_textField'),
        labelText: 'Email',
        onChanged: (email) {},
        errorText: _getValidationErrorMessage(email),
        autofillHints: const [AutofillHints.email],
        keyboardType: TextInputType.emailAddress,
      ),
    );
  }

  String? _getValidationErrorMessage(
    EmailValidationError? error,
  ) {
    switch (error) {
      case EmailValidationError.invalid:
        return 'Invalid email';
      case EmailValidationError.empty:
        return 'enter email';
      case null:
        return null;
    }
  }
}

class _ForgotPasswordButton extends StatelessWidget {
  const _ForgotPasswordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextLinkButton(
      key: const Key('signInView_forgotPassword_textButton'),
      title: 'Forgot password?',
      link: '',
      direction: Axis.horizontal,
      onPressed: () => context.go('/forgot_password_page'),
    );
  }
}

class _SignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: NiceSpacing.xxxlg,
      ),
      child: SizedBox(
        width: double.infinity,
        child: PrimaryActionButton(
          key: const Key('signInView_signIn_textButton'),
          title: 'Sign In',
          onPressed: () {
            Navigator.of(context)
                .pushReplacement<void, void>(MainAnalysesPage.route());
          },
        ),
      ),
    );
  }
}

class _GoToSignUp extends StatelessWidget {
  const _GoToSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextLinkButton(
      key: const Key('signInView_goToSignUp_textButton'),
      title: 'Go to sign up',
      link: '',
      onPressed: () => context.go('/sign_up_page'),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PasswordValidationError password = PasswordValidationError.invalid;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: NiceSpacing.lg,
      ),
      child: NicePasswordTextField(
        key: const Key('signInView_passwordInput_textField'),
        labelText: 'Password',
        onChanged: (password) {},
        errorText: _getValidationErrorMessage(password),
      ),
    );
  }

  String? _getValidationErrorMessage(
    PasswordValidationError? error,
  ) {
    switch (error) {
      case PasswordValidationError.invalid:
        return 'Invalid password';
      case PasswordValidationError.empty:
        return 'Please enter a password';
      case null:
        return null;
    }
  }
}
