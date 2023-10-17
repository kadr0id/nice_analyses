import 'package:flutter/material.dart';

import 'book_analyses_view.dart';

class BookAnalysesPage extends StatelessWidget {
  const BookAnalysesPage({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute<void>(
      builder: (context) => const BookAnalysesPage(),
      settings: const RouteSettings(name: '/book_analyses'),
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

        child: const BookAnalysesView(),

      ),
    );
  }
}