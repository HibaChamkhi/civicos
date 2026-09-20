import 'package:civicos/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Labeled text input. The label always stays visible above the value, so
/// people never lose track of what a filled-in field was for.
class CivicTextField extends StatefulWidget {
  const CivicTextField({
    required this.label,
    super.key,
    this.controller,
    this.hint,
    this.errorText,
    this.validator,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.autofillHints,
    this.onChanged,
    this.onSubmitted,
    this.enabled = true,
  });

  final String label;
  final TextEditingController? controller;
  final String? hint;

  /// An error to show regardless of [validator], e.g. from the server.
  final String? errorText;
  final FormFieldValidator<String>? validator;

  /// Password-style entry with a show/hide toggle.
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool enabled;

  @override
  State<CivicTextField> createState() => _CivicTextFieldState();
}

class _CivicTextFieldState extends State<CivicTextField> {
  late bool _obscured = widget.obscureText;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return TextFormField(
      controller: widget.controller,
      enabled: widget.enabled,
      obscureText: _obscured,
      enableSuggestions: !widget.obscureText,
      autocorrect: !widget.obscureText,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      autofillHints: widget.autofillHints,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmitted,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUnfocus,
      decoration: InputDecoration(
        labelText: widget.label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: widget.hint,
        errorText: widget.errorText,
        suffixIcon: widget.obscureText
            ? IconButton(
                tooltip: _obscured ? l10n.passwordShow : l10n.passwordHide,
                icon: Icon(_obscured ? LucideIcons.eye : LucideIcons.eyeOff),
                onPressed: () => setState(() => _obscured = !_obscured),
              )
            : null,
      ),
    );
  }
}
