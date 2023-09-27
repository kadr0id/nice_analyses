import 'package:flutter/widgets.dart';

import 'nice_font_weight.dart';

/// Very Good Text Style Definitions
abstract class NiceTextStyle {
  static const _baseTextStyle = TextStyle(
      fontWeight: NiceFontWeight.regular,
      height: 1.5,
      fontFamily: 'Formular',
      //color: NiceColors.primaryAccent
      );

  /// Headline 1 Text Style
  static final TextStyle headline1 = _baseTextStyle.copyWith(
    fontSize: 36,
    fontWeight: NiceFontWeight.regular,
    height: 1.25,
  );

  /// Headline 2 Text Style
  static final TextStyle headline2 = _baseTextStyle.copyWith(
    fontSize: 24,
    fontWeight: NiceFontWeight.regular,
    height: 1.25,
  );

  /// Headline 3 Text Style
  static final TextStyle headline3 = _baseTextStyle.copyWith(
    fontSize: 20,
    fontWeight: NiceFontWeight.regular,
    height: 1.25,
  );

  /// Headline 4 Text Style
  static final TextStyle headline4 = _baseTextStyle.copyWith(
    fontSize: 16,
    fontWeight: NiceFontWeight.medium,
    height: 1.25,
  );

  /// Body Text 1 Text Style
  static final TextStyle bodyText1 = _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: NiceFontWeight.regular,
  );

  /// Body Text 2 Text Style (the default)
  static final TextStyle bodyText2 = _baseTextStyle.copyWith(
    fontSize: 12,
  );

  /// Button Text Style
  static final TextStyle button = _baseTextStyle.copyWith(
    fontSize: 14,
    fontWeight: NiceFontWeight.medium,
  );

  /// Caption Text Style
  static final TextStyle caption = _baseTextStyle.copyWith(
    fontSize: 10,
    fontWeight: NiceFontWeight.medium,
  );
}
