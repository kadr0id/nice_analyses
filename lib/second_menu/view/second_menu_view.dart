import 'package:flutter/material.dart';

class SecondMenuView extends StatelessWidget {
  const SecondMenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: Colors.green,
          ),
        )
      ],
    );
  }
}
