import 'package:flutter/material.dart';
import 'package:nice_analyses/app/nice_ui/nice_ui.dart';

import '../colors/nice_colors.dart';

/// {@template nice_theme}
/// The Default [ThemeData].
/// {@endtemplate}
class NiceTheme {
  /// {@macro nice_theme}
  const NiceTheme();

  /// Default `ThemeData` for Nice UI.
  ThemeData get themeData {
    return ThemeData(
      useMaterial3: true,
      canvasColor: _backgroundColor,
      scaffoldBackgroundColor: _backgroundColor,
      bottomNavigationBarTheme: _bottomNavigationBarTheme,
      iconTheme: _iconTheme,
      appBarTheme: _appBarTheme,
      dividerTheme: _dividerTheme,
      textTheme: _textTheme,
      inputDecorationTheme: _inputDecorationTheme,
      buttonTheme: _buttonTheme,
      snackBarTheme: _snackBarTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      textButtonTheme: _textButtonTheme,
      textSelectionTheme: _textSelectionThemeData,
      bottomSheetTheme: _bottomSheetThemeData,
      focusColor: _focusedColor,
      unselectedWidgetColor: _unselectedWidgetColor,
      colorSchemeSeed: NiceColors.oceanBlue,
    );
  }

  AppBarTheme get _appBarTheme {
    return const AppBarTheme().copyWith(
      backgroundColor: Colors.white,
      titleTextStyle: NiceTextStyle.headline4,
      elevation: 0,
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.indigo),
    );
  }

  IconThemeData get _iconTheme {
    return const IconThemeData();
  }

  DividerThemeData get _dividerTheme {
    return const DividerThemeData();
  }

  TextTheme get _textTheme {
    return TextTheme(
      displayLarge: NiceTextStyle.headline1,
      displayMedium: NiceTextStyle.headline2,
      displaySmall: NiceTextStyle.headline3,
      headlineMedium: NiceTextStyle.headline4,
      bodyLarge: NiceTextStyle.bodyText1,
      bodyMedium: NiceTextStyle.bodyText2,
      labelLarge: NiceTextStyle.button,
      bodySmall: NiceTextStyle.caption,
    ).apply(
      bodyColor: NiceColors.primaryAccent,
      displayColor: NiceColors.primaryAccent,
      decorationColor: NiceColors.primaryAccent,
    );
  }

  SnackBarThemeData get _snackBarTheme {
    return SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }

  InputDecorationTheme get _inputDecorationTheme {
    return InputDecorationTheme(
      hintStyle: TextStyle(color: NiceColors.grey.shade500),
    );
  }

  ButtonThemeData get _buttonTheme {
    return const ButtonThemeData();
  }

  ElevatedButtonThemeData get _elevatedButtonTheme {
    return const ElevatedButtonThemeData();
  }

  TextButtonThemeData get _textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: NiceColors.black,
        textStyle: _textTheme.labelLarge?.copyWith(
          fontWeight: NiceFontWeight.light,
        ),
      ),
    );
  }

  BottomNavigationBarThemeData get _bottomNavigationBarTheme =>
      const BottomNavigationBarThemeData(
        selectedItemColor: NiceColors.primaryAccent,
        unselectedItemColor: NiceColors.secondaryAccent,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(fontSize: 10),
        unselectedLabelStyle: TextStyle(fontSize: 10),
        elevation: 0,
      );

  TextSelectionThemeData get _textSelectionThemeData =>
      const TextSelectionThemeData(cursorColor: NiceColors.black);

  Color get _backgroundColor => NiceColors.white;

  Color get _focusedColor => NiceColors.blue;

  Color get _unselectedWidgetColor => NiceColors.tertiaryAccent;
}

@override
BottomSheetThemeData get _bottomSheetThemeData => const BottomSheetThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40),
        ),
      ),
      clipBehavior: Clip.antiAlias,
    );
