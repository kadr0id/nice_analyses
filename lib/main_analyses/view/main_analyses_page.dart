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

  static Page page() {
    return const MaterialPage<void>(
      child: MainAnalysesPage(),
      name: '/main',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Main analyses',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
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
