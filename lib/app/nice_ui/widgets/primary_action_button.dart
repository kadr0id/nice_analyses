import 'package:flutter/material.dart';
import 'package:nice_analyses/app/nice_ui/widgets/base_action_button.dart';

import '../colors/nice_colors.dart';



/// {@template primary_action_button}
/// Primary button fo the actions
///  {@endtemplate}
class PrimaryActionButton extends BaseActionButton {
  /// {@macro primary_action_button}
  const PrimaryActionButton({
    Key? key,
    required String title,
    VoidCallback? onPressed,
    double? horizontalMargin,
  }) : super(
    key: key,
    title: title,
    onPressed: onPressed,
    backgroundColor: NiceColors.blue,
    horizontalMargin: horizontalMargin,
  );
}