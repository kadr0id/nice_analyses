import 'package:flutter/material.dart';
import 'package:nice_analyses/main_analyses/view/main_analyses_view.dart';

import '../../app/nice_ui/widgets/nice_app_bar.dart';

class MainAnalysesPage extends StatelessWidget {
  const MainAnalysesPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => const MainAnalysesPage(),
      settings: const RouteSettings(name: '/main-analyses'),
    );
  }

  static Page page() {
    return const MaterialPage<void>(
      child: MainAnalysesPage(),
      name: '/main',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NiceAppBar(
        title: 'Вибір аналізів',
        centerTitle: true,
      ),
      // AppBar(
      //   leading: IconButton(
      //     onPressed: () {},
      //     icon: const Icon(Icons.arrow_back_ios_rounded),
      //   ),
      //   centerTitle: true,
      //   title: const Text(
      //     'Вибір аналізів',
      //     style: TextStyle(
      //       fontSize: 24.0,
      //       fontWeight: FontWeight.bold,
      //       color: Colors.black,
      //     ),
      //   ),
      //   actions: const <Widget>[
      //     Icon(
      //       Icons.close_rounded,
      //     ),
      //
      //   ],
      //   backgroundColor: Colors.amber,
      // ),
      body: Container(
        color: Colors.white,
        child: const SafeArea(
          child: MainAnalysesView(),
        ),
      ),
    );
  }
}
