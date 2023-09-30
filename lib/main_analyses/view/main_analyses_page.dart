import 'package:flutter/material.dart';
import 'package:nice_analyses/main_analyses/view/main_analyses_view.dart';

class MainAnalysesPage extends StatelessWidget {
  const MainAnalysesPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(
      builder: (_) => const MainAnalysesPage(),
      settings: const RouteSettings(name: '/main-analyses'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Analyses'),
        elevation: 0,
        backgroundColor: Colors.amber,
      ),
      body: Container(
        color: Colors.white,
        child: const SafeArea(
          child: MainAnalysesView(),
        ),
      ),
    );
  }
}
