import 'package:flutter/material.dart';
import 'package:nice_analyses/sign_in/view/sign_in_view.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(
      builder: (context) => const SignInPage(),
      settings: const RouteSettings(name: '/sign-in'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SignInView(),
      ),
    );
  }
}
