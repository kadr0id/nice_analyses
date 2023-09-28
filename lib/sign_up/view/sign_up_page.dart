import 'package:flutter/material.dart';
import 'package:nice_analyses/sign_up/view/sign_up_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => const SignUpPage(),
      settings: const RouteSettings(name: '/sign-up'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          key: const Key('signInPage_back_button'),
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.of(context).pop(),
          color: Colors.black,
        ),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        color: Colors.white,
        child: const SafeArea(
          child: SignUpForm(),
        ),
      ),
    );
  }
}
