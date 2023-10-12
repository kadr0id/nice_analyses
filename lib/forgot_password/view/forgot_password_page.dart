import 'package:flutter/material.dart';
import 'package:nice_analyses/forgot_password/view/forgot_password_view.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => const ForgotPasswordPage(),
      settings: const RouteSettings(name: '/forgot-password'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          key: const Key('forgotPassword_back_button'),
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.of(context).pop(),
          color: Colors.black,
        ),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        color: Colors.white,
        child: const SafeArea(
          child: ForgotPasswordView(),
        ),
      ),
    );
  }
}
