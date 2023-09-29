import 'package:flutter/material.dart';
import 'package:nice_analyses/main_analyses.dart';
import 'package:nice_analyses/sign_in/view/sign_in_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nice app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  const MainAnalyses(),
    );
  }
}
