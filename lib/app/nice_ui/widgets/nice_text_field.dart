import 'package:flutter/material.dart';

import '../nice_text_style.dart';

/// {@template nice_text_field}
/// Creates customized TextField
/// {@endtemplate}
class NiceTextField extends StatelessWidget {
  /// {@macro nice_text_field}
  const NiceTextField({
    Key? key,
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.obscureText = false,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.enabled,
    this.maxLength,
    this.labelText,
    this.errorText,
    this.suffix,
    this.errorMaxLines,
    this.infoText,
    this.label,
    this.autofillHints,
    this.textInputAction = TextInputAction.next,
    this.textCapitalization,
  }) : super(key: key);

  /// [TextEditingController] of the underlying [TextField]
  final TextEditingController? controller;

  /// [FocusNode] of the underlying [TextField]
  final FocusNode? focusNode;

  /// [TextInputType] of the underlying [TextField]
  final TextInputType? keyboardType;

  /// [obscureText] of the underlying [TextField]
  final bool obscureText;

  /// [onChanged] of the underlying [TextField]
  final void Function(String)? onChanged;

  /// [onEditingComplete] of the underlying [TextField]
  final void Function()? onEditingComplete;

  /// [onSubmitted] of the underlying [TextField]
  final void Function(String)? onSubmitted;

  /// [enabled] of the underlying [TextField]
  final bool? enabled;

  /// [maxLength] of the underlying [TextField]
  final int? maxLength;

  /// [labelText] of the underlying [TextField]
  ///
  /// Only one of the [label] and [labelText] can be specified
  final String? labelText;

  /// [label] of the underlying [TextField]
  ///
  /// Only one of the [label] and [labelText] can be specified
  final Widget? label;

  /// [errorText] of the underlying [TextField]
  final String? errorText;

  /// [suffix] of the underlying [TextField]
  final Widget? suffix;

  /// [errorMaxLines] of the underlying [TextField]
  final int? errorMaxLines;

  /// Optional informational text to display below the [TextField]
  ///
  /// If both [infoText] and [errorText] are provided,
  /// only the [errorText] would be displayed
  final String? infoText;

  /// Autofill hints passed to the underlying TextField
  final Iterable<String>? autofillHints;

  /// The type of action button to use for the keyboard.
  final TextInputAction textInputAction;

  /// Configures how the platform keyboard will select an uppercase or
  /// lowercase keyboard.
  final TextCapitalization? textCapitalization;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onSubmitted: onSubmitted,
      enabled: enabled,
      maxLength: maxLength,
      keyboardAppearance: Theme.of(context).brightness,
      //style: NiceTextStyle.bodyText1,
      textInputAction: textInputAction,
      autofillHints: autofillHints,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      decoration: InputDecoration(
        label: label,
        labelText: labelText,
        labelStyle:
        NiceTextStyle.bodyText1.copyWith(color: Colors.black12),
        errorText: errorText ?? infoText,
        errorStyle: errorText != null
            ? NiceTextStyle.bodyText2.copyWith(color: Colors.red)
            : NiceTextStyle.bodyText2
            .copyWith(color: Colors.blueGrey),
        suffixIcon: suffix,
        errorMaxLines: errorMaxLines,
        alignLabelWithHint: true,
        errorBorder: errorText != null ? _redInputBorder : _tertiaryInputBorder,
        focusedErrorBorder:
        errorText != null ? _redInputBorder : _tertiaryInputBorder,
        focusedBorder: _tertiaryInputBorder,
        disabledBorder: _tertiaryInputBorder,
        enabledBorder: _tertiaryInputBorder,
      ),
    );
  }

  InputBorder get _tertiaryInputBorder => const UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.blueGrey,
    ),
  );

  InputBorder get _redInputBorder => const UnderlineInputBorder(
    borderSide: BorderSide(
      color: Colors.red,
    ),
  );
}
