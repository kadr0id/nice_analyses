import 'package:flutter/material.dart';
import 'package:nice_analyses/app/nice_ui/nice_ui.dart';
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
      appBar: NiceAppBar(
        title: 'Вибір аналізів',
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {},
              icon: const Icon(Icons.close_rounded))
        ],
      ),
      body:  const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(NiceSpacing.md),
            child: MainAnalysesView(),
          ),
        ),
    );
  }
}
