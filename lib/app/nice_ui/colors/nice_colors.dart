import 'package:flutter/material.dart';

/// Defines the color palette for the Nice Colors UI Kit.
/// Each color is a single color as well a color swatch with shades.
///
/// The color's shades are referred to by index. The greater the index, the
/// darker the color. There are 10 valid indices: 50, 100, 200, ..., 900.
abstract class NiceColors {
  /// Black
  static const Color black = Color(0xFF000000);

  /// White
  static const Color white = Color(0xFFFFFFFF);

  /// Transparent
  static const Color transparent = Color(0x00000000);

  /// The grey primary color and swatch.
  static const MaterialColor grey = Colors.grey;

  /// The green primary color and swatch.
  static const MaterialColor green = Colors.green;

  /// The blue primary color and swatch.
  static const Color blue = Color(0xFF3898EC);

  /// The ocean blue primary color and swatch.
  static const Color oceanBlue = Color(0xFF02569B);

  /// The dark primary color.
  static const Color darkPrimary = Color(0xFF030F1E);

  /// The dark secondary color.
  static const Color darkSecondary = Color(0x80030F1E);

  /// The water primary color.
  static const Color water = Color(0xFFBBE1FF);

  /// The primary accent primary color.
  static const Color primaryAccent = Color(0xFF001F40);

  /// The secondary accent color.
  static const Color secondaryAccent = Color(0x80001F40);

  /// The tertiary accent color.
  static const Color tertiaryAccent = Color(0x4D001F40);

  /// The orange primary color.
  static const Color orange = Color(0xFFFFA060);

  /// The light orange primary color.
  static const Color lightOrange = Color(0x80FFA060);

  /// The brown text color.
  static const Color brown = Color(0xFF8D3900);

  /// The light water primary color.
  static const Color lightWater = Color(0x80BBE1FF);

  /// The safety green primary color.
  static const Color greenPrimary = Color(0xFF79D277);

  /// The safety green secondary color.
  static const Color greenSecondary = Color(0x8079D277);

  /// The safety green text color.
  static const Color greenText = Color(0xFF0B5301);

  /// The red primary color.
  static const Color redPrimary = Color(0xFFFF8179);

  /// The red secondary color.
  static const Color redSecondary = Color(0xFFFFBEB5);

  /// The red text color.
  static const Color redText = Color(0xFF770000);

  /// White secondary
  static const Color whiteSecondary = Color(0xFFFCFCFC);

  /// Element gray
  static const Color elementGray = Color(0x1A12132D);

  ///The red danger text color.
  static const Color dangerText = Color(0xFFFC6767);
}
