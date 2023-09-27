import 'package:flutter/material.dart';

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
    return const ScrollableColumn(
      mainAxisSize: MainAxisSize.min,
      children: [
        RegistrationHeader(title: 'Sign Up'),
        Spacer(flex: 4),
        _FirstNameInput(),
        SizedBox(height: NiceSpacing.xs),
        // const _LastNameInput(),
        SizedBox(height: NiceSpacing.xs),
        // const _EmailInput(),
        SizedBox(height: NiceSpacing.xs),
        //  const _PasswordInput(),
        SizedBox(height: NiceSpacing.xs),
        //  const _ConfirmPasswordInput(),
        //const _TermsOfUse(),
        Spacer(flex: 4),
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
