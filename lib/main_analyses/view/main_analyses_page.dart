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
        elevation: 0,
        title: const Text(
          'Main analyses',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold, // Жирний шрифт
            color: Colors.black, // Колір
          ),
        ),

        // leading: IconButton(
        //   key: const Key('mainAnalyses_back_button'),
        //   icon: const Icon(Icons.arrow_back_rounded),
        //   onPressed: () => Navigator.of(context).pop(),
        //   color: Colors.black,
        // ),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: MainAnalysesView(),
        ),
      ),
    );
  }
}
