import 'package:flutter/material.dart';

class MenuItemWidget extends StatelessWidget {
  final String item;

  MenuItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 4.0, bottom: 4.0),
      child: Text(
        item,
        style: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 12.0,
        ),
      ),
    );
  }
}
