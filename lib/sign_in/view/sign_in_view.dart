import 'package:flutter/material.dart';
import '../../app/form_inputs/email.dart';
import '../../app/nice_ui/nice_spacing.dart';
import '../../app/nice_ui/widgets/nice_text_field.dart';
import '../../app/nice_ui/widgets/registration_header.dart';
import '../../app/nice_ui/widgets/scrollable_column.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ScrollableColumn(
          children: [
            const RegistrationHeader(title: 'Hello Nice analyses!'),
            const Spacer(flex: 2),
            _EmailInput(),
            const SizedBox(height: NiceSpacing.xs),
            // _PasswordInput(),
            const Spacer(flex: 10),
            const SizedBox(height: NiceSpacing.sm),
          ],
        ),
      ],
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
