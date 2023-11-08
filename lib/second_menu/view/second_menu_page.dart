import 'package:flutter/material.dart';
import 'package:nice_analyses/second_menu/view/second_menu_view.dart';

class SecondMenuPage extends StatelessWidget {
  const SecondMenuPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(
      builder: (context) => const SecondMenuPage(),
      settings: const RouteSettings(name: '/second-menu'),
    );
  }

  static Page page(String s) {
    return const MaterialPage<void>(
      child: SecondMenuPage(),
      name: '/second-menu',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
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

          child: const SecondMenuView(),

      ),
    );
  }
}
