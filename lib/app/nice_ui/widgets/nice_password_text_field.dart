import 'package:flutter/material.dart';
import '../typography/nice_text_style.dart';
import 'nice_text_field.dart';

/// {@template nice_password_text_field}
/// Creates customized TextField with a suffix icon to obscure the text
/// {@endtemplate}
class NicePasswordTextField extends StatefulWidget {
  /// {@macro nice_password_text_field}
  const NicePasswordTextField({
    Key? key,
    this.controller,
    this.focusNode,
    this.keyboardType = TextInputType.visiblePassword,
    this.obscureText = true,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.enabled,
    this.maxLength,
    this.labelText,
    this.errorText,
    this.errorMaxLines,
    this.infoText,
    this.confirmPasswordMatches,
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

  /// [labelText] of the underlying [TextField ]
  final String? labelText;

  /// [errorText] of the underlying [TextField]
  final String? errorText;

  /// [errorMaxLines] of the underlying [TextField]
  final int? errorMaxLines;

  /// Optional informational text to display below the [TextField]
  ///
  /// If both [infoText] and [errorText] are provided,
  /// only the [errorText] would be displayed
  final String? infoText;

  /// Optional parameter, which allows to display a checkmark
  /// inside of the label if confirm password matches the password
  final bool? confirmPasswordMatches;

  @override
  State<NicePasswordTextField> createState() => NicePasswordTextFieldState();
}

/// {@template nice_text_field_state}
/// State of the NicePasswordTextField
/// {@endtemplate}
@visibleForTesting
class NicePasswordTextFieldState extends State<NicePasswordTextField> {
  /// Indicates wether the text of the underlying [NiceTextField]
  /// should be obscured or not
  late bool obscureText;

  @override
  void initState() {
    super.initState();
    obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return NiceTextField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      keyboardType: widget.keyboardType,
      obscureText: obscureText,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
      onSubmitted: widget.onSubmitted,
      enabled: widget.enabled,
      maxLength: widget.maxLength,
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.labelText != null)
            Text(
              widget.labelText!,
              style: NiceTextStyle.bodyText1.copyWith(color: Colors.black12),
            ),
          Icon(
            Icons.check,
            color: (widget.confirmPasswordMatches ?? false)
                ? Colors.green
                : Colors.transparent,
          ),
        ],
      ),
      errorText: widget.errorText,
      errorMaxLines: widget.errorMaxLines,
      infoText: widget.infoText,
      autofillHints: const [AutofillHints.newPassword],
      suffix: ObscurePasswordButton(
        isOn: obscureText,
        onTap: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
      ),
    );
  }
}

/// {@template nice_text_field_obscure_password_button}
/// Suffix icon which is used to obscure password
/// {@endtemplate}
@visibleForTesting
class ObscurePasswordButton extends StatefulWidget {
  /// {@macro nice_text_field_obscure_password_button}
  const ObscurePasswordButton({
    Key? key,
    required this.isOn,
    required this.onTap,
  }) : super(key: key);

  /// Indicates whether [Icons.visibility_off] or
  /// [Icons.visibility] should be displayed
  final bool isOn;

  /// Callback used by [NicePasswordTextField] to update
  /// the obscureText property
  final Function() onTap;

  @override
  State<ObscurePasswordButton> createState() => _ObscurePasswordButtonState();
}

class _ObscurePasswordButtonState extends State<ObscurePasswordButton> {
  final FocusNode focusNode = FocusNode(skipTraversal: true);

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Obscure password button',
      enabled: true,
      button: true,
      selected: widget.isOn,
      focusable: false,
      child: IconButton(
        onPressed: widget.onTap,
        focusNode: focusNode,
        icon: Icon(
          widget.isOn ? Icons.visibility : Icons.visibility_off,
        ),
      ),
    );
  }
}
