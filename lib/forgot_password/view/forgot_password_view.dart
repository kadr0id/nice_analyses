import 'package:flutter/material.dart';
import 'package:nice_analyses/app/nice_ui/typography/nice_spacing.dart';
import 'package:nice_analyses/sign_in/sign_in.dart';
import '../../app/form_inputs/email.dart';
import '../../app/nice_ui/nice_ui.dart';


class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

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
            const Spacer(flex: 5),
            _RecoverPassword(),
            const _GoToSignIn(),
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
      child: Column(   
        children: [
          const Text(
            'Enter your email and we will send you a password reset',
            style: TextStyle(fontSize: 12, color: Colors.black),  // Стиль тексту
          ),
          NiceTextField(
            key: const Key('forgotPassword_emailInput_textField'),
            labelText: 'Enter your Email',
            onChanged: (email) {},
            errorText: _getValidationErrorMessage(email),
            autofillHints: const [AutofillHints.email],
            keyboardType: TextInputType.emailAddress,
          ),
        ],
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

class _RecoverPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: NiceSpacing.xxxlg,
      ),
      child: SizedBox(
        width: double.infinity,
        child: PrimaryActionButton(
          key: const Key('forgotPassword_textButton'),
          title: 'Recover Password',
          onPressed: () {},
        ),
      ),
    );
  }
}

class _GoToSignIn extends StatelessWidget {
  const _GoToSignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextLinkButton(
        key: const Key('forgotPassword_goToSignIn_textButton'),
        title: 'Go to sign in',
        link: '',
        onPressed: () {
          Navigator.of(context).pushReplacement<void, void>(SignInPage.route());
        });
  }
}
