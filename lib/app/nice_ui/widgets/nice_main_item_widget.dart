import 'package:flutter/material.dart';
import 'package:nice_analyses/app/nice_ui/nice_ui.dart';

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
      padding: const EdgeInsets.only(bottom: NiceSpacing.sm),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          // gradient: LinearGradient(
          //     begin: Alignment.centerRight,
          //     end: Alignment.centerLeft,
          //     colors: [Colors.grey, Colors.white]),
        ),
        child: child,
      ),
    );
  }
}
