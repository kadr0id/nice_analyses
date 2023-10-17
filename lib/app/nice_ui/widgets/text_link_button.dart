import 'package:flutter/material.dart';
import '../typography/nice_spacing.dart';
import '../typography/nice_text_style.dart';

/// {@template text_link_button}
/// Creates a Text Link button.
/// The button which represents links in the text
/// {@endtemplate}
class TextLinkButton extends StatelessWidget {
  /// {@macro text_link_button}
  const TextLinkButton({
    Key? key,
    this.title,
    required this.link,
    this.onPressed,
    this.textStyle,
    this.direction,
  }) : super(key: key);

  /// Link button title text
  final String? title;

  ///  Link button link text
  final String link;

  /// Callback to be called when user tap on text
  final VoidCallback? onPressed;

  /// Text style applied to the [title] and [link]
  final TextStyle? textStyle;

  /// Direction how the [title] and [link] should be positioned
  final Axis? direction;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed != null
          ? () {
              FocusScope.of(context).unfocus();
              onPressed?.call();
            }
          : null,
      child: Padding(
        padding: const EdgeInsets.all(NiceSpacing.sm),
        child: Flex(
          direction: direction ?? Axis.vertical,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (title != null)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: NiceSpacing.sm,
                  vertical: NiceSpacing.xs,
                ),
                child: Text(
                  title!,
                  style: textStyle ?? NiceTextStyle.bodyText1,
                ),
              ),
            Text(
              link,
              style: (textStyle ?? NiceTextStyle.bodyText1)
                  .copyWith(color: Colors.orange),
            ),
          ],
        ),
      ),
    );
  }
}
