import 'package:flutter/material.dart';

class MenuTitleWidget extends StatelessWidget {
  final String title;

  MenuTitleWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
      ),
    );
  }
}
