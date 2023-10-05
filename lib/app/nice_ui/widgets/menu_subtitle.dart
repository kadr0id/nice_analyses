import 'package:flutter/material.dart';

class MenuSubTitleWidget extends StatelessWidget {
  final String subTitle;

  MenuSubTitleWidget({required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Text(
      subTitle,
      style: const TextStyle(
        fontStyle: FontStyle.italic,
        fontSize: 16.0,
      ),
    );
  }
}
