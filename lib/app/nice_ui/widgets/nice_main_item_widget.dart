import 'package:flutter/material.dart';

/// {@template nice_main_item}
/// Creates a nice main item.
///
/// Can be extended for various different use purposes.
///
/// {@endtemplate}
class NiceMainItem extends StatelessWidget {
  /// {@macro nice_main_item}
  const NiceMainItem({
    Key? key,
    required this.child,
  }) : super(key: key);

  /// Title which describes main_item purpose
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [Colors.grey, Colors.white])),
        child: child,
      ),
    );
  }
}
