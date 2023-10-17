import 'package:flutter/material.dart';

import '../typography/nice_spacing.dart';

/// {@template registration_header}
/// Creates a header widget that's reused throughout the registration screens
/// {@endtemplate}
class RegistrationHeader extends StatelessWidget {
  /// {@macro registration_header}
  const RegistrationHeader({
    Key? key,
    required this.title,
    this.textStyle,
    this.imageSize,
  }) : super(key: key);

  /// Title of the widget
  final String title;

  /// Optional TextStyle of the [title]
  /// Defaults to [NiceTextStyle.headline1]!in future! if no value provided
  final TextStyle? textStyle;

  /// Optional size of the underlying image
  final double? imageSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/icons/medicos_menu.png'),
        const SizedBox(
          height: NiceSpacing.xlg,
        ),
        Text(
          title,
          style: textStyle ?? const TextStyle(),
        )
      ],
    );
  }
}
