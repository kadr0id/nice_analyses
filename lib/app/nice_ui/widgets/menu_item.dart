import 'package:flutter/material.dart';

class MenuItemWidget extends StatelessWidget {
  final String item;

  const MenuItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, top: 6.0, bottom: 6.0),
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
