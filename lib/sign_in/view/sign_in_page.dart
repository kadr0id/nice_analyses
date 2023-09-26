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
    return Scaffold(
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
          child: SignInView(),
        ),
      ),
    );
  }
}
