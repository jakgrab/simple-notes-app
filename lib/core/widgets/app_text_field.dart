import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.textInputAction = TextInputAction.newline,
    this.onChanged,
    this.keyboardType = TextInputType.text,
  });

  final TextInputAction textInputAction;
  final void Function(String)? onChanged;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: textInputAction,
      style: const TextStyle(fontSize: 16),
      autofocus: true,
      maxLines: null,
      minLines: 3,
      onChanged: onChanged,
    );
  }
}
