import 'package:flutter/material.dart';
import '../typography/nice_spacing.dart';

/// {@template base_action_button}
/// Creates a base action button.
///
/// Can be extended for various different use purposes.
///
/// {@endtemplate}
class BaseActionButton extends StatelessWidget {
  /// {@macro base_action_button}
  const BaseActionButton({
    Key? key,
    required this.title,
    this.onPressed,
    this.textStyle = defaultTextStyle,
    this.backgroundColor = Colors.white,
    this.borderColor,
    this.horizontalMargin,
  }) : super(key: key);

  /// Default button corner radius
  static const double defaultCornerRadius = 14;

  /// Default action button title text style
  static const TextStyle defaultTextStyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: Colors.black,
  );

  /// Title of the underlying [TextButton].
  final String title;

  /// Action function of the [TextButton].
  final VoidCallback? onPressed;

  /// Text style  of the underlying [TextButton] title.
  final TextStyle? textStyle;

  /// Background color [TextButton].
  final Color backgroundColor;

  /// Border color [TextButton].
  final Color? borderColor;

  /// Horizontal margin for [TextButton].
  final double? horizontalMargin;

  @override
  Widget build(BuildContext context) {
    final button = TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(NiceSpacing.lg),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultCornerRadius),
          side: BorderSide(
            color: borderColor ?? backgroundColor,
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(title, style: textStyle),
    );
    if (horizontalMargin == null || horizontalMargin == 0) return button;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalMargin!),
      child: button,
    );
  }
}
