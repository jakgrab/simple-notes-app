import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.textInputAction = TextInputAction.newline,
    required this.labelText,
    this.onChanged,
    this.displayError,
    this.keyboardType = TextInputType.text,
    this.errorText,
  });

  final TextInputAction textInputAction;
  final String labelText;
  final String? errorText;
  final void Function(String)? onChanged;
  final TextInputType keyboardType;
  final dynamic displayError;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: textInputAction,
      style: const TextStyle(fontSize: 16),
      // cursorHeight: 14,
      autofocus: true,
      maxLines: null,
      minLines: 3,
      decoration: InputDecoration(
        // contentPadding: const EdgeInsets.all(12),
        // isDense: true,
        border: const OutlineInputBorder(),
        labelStyle: const TextStyle(fontSize: 14),
        labelText: labelText,
        errorText: errorText,
        errorStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
      ),
      onChanged: onChanged,
    );
  }
}
