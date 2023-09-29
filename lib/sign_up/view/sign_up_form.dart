import 'package:flutter/material.dart';
import 'package:nice_analyses/app/form_inputs/email.dart';
import 'package:nice_analyses/app/form_inputs/password.dart';
import 'package:nice_analyses/app/nice_ui/widgets/nice_password_text_field.dart';

import '../../app/nice_ui/nice_spacing.dart';
import '../../app/nice_ui/widgets/nice_text_field.dart';
import '../../app/nice_ui/widgets/primary_action_button.dart';
import '../../app/nice_ui/widgets/registration_header.dart';
import '../../app/nice_ui/widgets/scrollable_column.dart';
import '../../app/nice_ui/widgets/text_link_button.dart';
import '../../faq/faq.dart';
import '../../second_menu/view/second_menu_page.dart';
import '../../sign_in/view/sign_in_page.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  const ScrollableColumn(
      mainAxisSize: MainAxisSize.min,
      children: [
        RegistrationHeader(title: 'Sign Up'),
        Spacer(flex: 4),
        _FirstNameInput(),
        SizedBox(height: NiceSpacing.xs),
        _LastNameInput(),
        SizedBox(height: NiceSpacing.xs),
        _EmailInput(),
        SizedBox(height: NiceSpacing.xs),
        _PasswordInput(),
        SizedBox(height: NiceSpacing.xs),
        _ConfirmPasswordInput(),
        _TermsOfUse(),
        Spacer(flex: 4),
        _SignUpButton(),
        Spacer(flex: 2),
        _SignIn(),
        SizedBox(height: NiceSpacing.sm)
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
  const _EmailInput({Key? key}) : super(key: key);

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

class _TermsOfUse extends StatelessWidget {
  const _TermsOfUse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextLinkButton(
        key: const Key('signUpForm_termsOfUse_textButton'),
        title: 'by signing up user accepts',
        link: 'Terms of use',
        direction: Axis.horizontal,
        onPressed: () {
          Navigator.of(context).pushReplacement<void, void>(FaqPage.route());
        });
  }
}

class _SignUpButton extends StatelessWidget {
  const _SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: NiceSpacing.xxxlg,
      ),
      child: SizedBox(
        width: double.infinity,
        child: PrimaryActionButton(
          key: const Key('signUpForm_signUp_textButton'),
          title: 'Sign Up',
          onPressed: () {
            FocusScope.of(context).unfocus();
            Navigator.of(context)
                .pushReplacement<void, void>(SecondMenuPage.route());
          },
        ),
      ),
    );
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
