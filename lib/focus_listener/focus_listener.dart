import 'package:flutter/cupertino.dart';

class FocusListener extends StatelessWidget {
  const FocusListener({Key? key, this.child}) : super(key: key);

  /// {@macro flutter.widgets.ProxyWidget.child}
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: child,
    );
  }
}