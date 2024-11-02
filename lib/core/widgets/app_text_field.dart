import 'package:flutter/material.dart';
import 'package:simple_notes_app/core/constants/colors.dart';
import 'package:simple_notes_app/core/extensions/text_theme_on_build_context.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.textInputAction = TextInputAction.newline,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.initialText,
  });

  final TextInputAction textInputAction;
  final void Function(String)? onChanged;
  final TextInputType keyboardType;
  final String? initialText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialText,
      textInputAction: textInputAction,
      style: context.textTheme.bodyLarge?.copyWith(color: AppColors.black),
      autofocus: true,
      maxLines: null,
      minLines: 3,
      cursorColor: AppColors.brown,
      onChanged: onChanged,
    );
  }
}
