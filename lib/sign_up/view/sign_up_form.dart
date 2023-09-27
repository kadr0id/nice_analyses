import 'package:flutter/material.dart';
import 'package:nice_analyses/app/form_inputs/email.dart';
import 'package:nice_analyses/app/form_inputs/password.dart';
import 'package:nice_analyses/app/nice_ui/widgets/nice_password_text_fiel.dart';

import '../../app/nice_ui/nice_spacing.dart';
import '../../app/nice_ui/widgets/nice_text_field.dart';
import '../../app/nice_ui/widgets/registration_header.dart';
import '../../app/nice_ui/widgets/scrollable_column.dart';
import '../../app/nice_ui/widgets/text_link_button.dart';
import '../../sign_in/view/sign_in_page.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollableColumn(
      mainAxisSize: MainAxisSize.min,
      children: [
        const RegistrationHeader(title: 'Sign Up'),
        const Spacer(flex: 4),
        const _FirstNameInput(),
        const SizedBox(height: NiceSpacing.xs),
        const _LastNameInput(),
        const SizedBox(height: NiceSpacing.xs),
        _EmailInput(),
        const SizedBox(height: NiceSpacing.xs),
        const _PasswordInput(),
        const SizedBox(height: NiceSpacing.xs),
        const _ConfirmPasswordInput(),
        //const _TermsOfUse(),
        const Spacer(flex: 4),
        const Spacer(flex: 2),
        const _SignIn(),
        const SizedBox(height: NiceSpacing.sm)
      ],
    );
  }
}

class _FirstNameInput extends StatelessWidget {
  const _FirstNameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: NiceSpacing.lg,
      ),
      child: NiceTextField(
        key: const Key('signUpForm_firstName_textField'),
        labelText: 'First name',
        onChanged: (firstName) {},
      ),
    );
  }
}

class _LastNameInput extends StatelessWidget {
  const _LastNameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: NiceSpacing.lg,
      ),
      child: NiceTextField(
        key: const Key('signUpForm_lastName_textField'),
        labelText: 'Last name',
        onChanged: (lastName) {},
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    EmailValidationError email = EmailValidationError.empty;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: NiceSpacing.lg,
      ),
      child: NiceTextField(
        key: const Key('signUpForm_emailInput_textField'),
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
        return 'Enter email';
      case null:
        return null;
    }
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
        key: const Key('signUpForm_passwordInput_textField'),
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

class _ConfirmPasswordInput extends StatelessWidget {
  const _ConfirmPasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PasswordValidationError password = PasswordValidationError.invalid;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: NiceSpacing.lg,
      ),
      child: NicePasswordTextField(
        key: const Key('signUpForm_confirmPasswordInput_textField'),
        labelText: 'Confirm password',
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

class _SignIn extends StatelessWidget {
  const _SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextLinkButton(
      key: const Key('signUpForm_signIn_textButton'),
      title: 'Do you already have an account?',
      link: 'Sign in',
      direction: Axis.vertical,
      onPressed: () =>
          Navigator.of(context).pushReplacement<void, void>(SignInPage.route()),
    );
  }
}
