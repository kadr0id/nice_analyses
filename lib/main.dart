import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nice_analyses/app/nice_ui/theme/nice_theme.dart';
import 'package:nice_analyses/sign_in/view/sign_in_page.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nice Analyses',
      theme: const NiceTheme().themeData,
      home: const SignInPage(),
    );
  }
}
