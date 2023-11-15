import 'package:flutter/material.dart';

class MenuSubTitleWidget extends StatelessWidget {
  final String subTitle;

  const MenuSubTitleWidget({
    Key? key,
    required this.subTitle,
  }) : super(key: key);

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
