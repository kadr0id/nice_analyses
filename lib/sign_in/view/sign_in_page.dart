import 'package:flutter/material.dart';
import 'package:nice_analyses/sign_in/view/sign_in_view.dart';

import '../../app/nice_ui/widgets/nice_app_bar.dart';

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
      appBar: const NiceAppBar(
        showLeading: false,
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
