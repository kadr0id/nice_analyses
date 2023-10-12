import 'package:flutter/material.dart';
import 'package:nice_analyses/app/nice_ui/widgets/primary_action_button.dart';
import 'package:nice_analyses/forgot_password/view/forgot_password_page.dart';
import 'package:nice_analyses/main_analyses/view/main_analyses_page.dart';
import '../../app/form_inputs/email.dart';
import '../../app/form_inputs/password.dart';
import '../../app/nice_ui/nice_spacing.dart';
import '../../app/nice_ui/widgets/nice_password_text_field.dart';
import '../../app/nice_ui/widgets/nice_text_field.dart';
import '../../app/nice_ui/widgets/registration_header.dart';
import '../../app/nice_ui/widgets/scrollable_column.dart';
import '../../app/nice_ui/widgets/text_link_button.dart';
import '../../sign_up/view/sign_up_page.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
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
      onPressed: () {
            Navigator.of(context)
                .pushReplacement<void, void>(ForgotPasswordPage.route());
          },
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
        onPressed: () {
          Navigator.of(context).pushReplacement<void, void>(SignUpPage.route());
        });
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
