import 'package:flutter/material.dart';

import '../colors/nice_colors.dart';

/// {@template nice_app_bar}
/// Reusable app bar that allows to define title,
/// leading and trailing widgets.
///
/// {@endtemplate}
class NiceAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// {@macro nice_app_bar}
  const NiceAppBar({
    Key? key,
    this.title = '',
    this.titleWidget,
    this.preferredSize = const Size.fromHeight(kToolbarHeight),
    this.color,
    this.showLeading = true,
    this.leading,
    this.actions,
    this.automaticallyImplyLeading = true,
    this.elevation,
    this.foregroundColor,
    this.flexibleSpace,
    this.centerTitle,
    this.leadingWidth,
  }) : super(key: key);

  /// App bar title
  final String title;

  /// Replace [NiceAppBar] title text widget if present for customization
  final Widget? titleWidget;

  /// Hides leading button
  final bool showLeading;

  /// [NiceAppBar] background color
  final Color? color;

  /// Leading widget of the app bar, by default back button
  final Widget? leading;

  /// Trailing widgets of the app bar, absent by default
  final List<Widget>? actions;

  /// Automatically imply leading for underlying [AppBar]
  final bool automaticallyImplyLeading;

  /// [AppBar] elevation
  final double? elevation;

  /// [AppBar] foreground color
  final Color? foregroundColor;

  /// [AppBar] flexible space
  final Widget? flexibleSpace;

  /// [AppBar] center title
  final bool? centerTitle;

  /// [AppBar] leading width
  final double? leadingWidth;

  /// App bar size
  @override
  final Size preferredSize;

  /// Default button corner radius
  static const double defaultCornerRadius = 14;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(defaultCornerRadius),
        side: const BorderSide(
          color: NiceColors.tertiaryAccent,
        ),
      ),
      title: titleWidget ?? Text(title,  style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: NiceColors.darkPrimary,
            ),),
      elevation: elevation,
      automaticallyImplyLeading: automaticallyImplyLeading,
      flexibleSpace: flexibleSpace,
      leadingWidth: leadingWidth,
      centerTitle: centerTitle,
     // backgroundColor: color,
     //  foregroundColor: foregroundColor,
      leading: showLeading ? (leading ?? _AppBarBackButton()) : null,
      actions: actions,
    );
  }
}

/// Default app bar leading widget - back button
class _AppBarBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      key: const Key('niceAppBar_backButton'),
      icon: const Icon(Icons.arrow_back_ios_rounded),
      color: Colors.indigo,
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
      onPressed: () => Navigator.of(context).maybePop(),
    );
  }
}