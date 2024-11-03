import 'package:flutter/material.dart';
import 'package:simple_notes_app/core/constants/colors.dart';
import 'package:simple_notes_app/core/constants/dimentions.dart';
import 'package:simple_notes_app/core/enums/data_status/data_status.dart';

class SaveNoteButton extends StatelessWidget {
  const SaveNoteButton({
    super.key,
    required this.canSave,
    required this.dataStatus,
    this.onSave,
  });

  final bool canSave;
  final DataStatus dataStatus;
  final VoidCallback? onSave;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: canSave ? onSave : null,
      icon: switch (dataStatus) {
        DataStatus.loading => const _LoadingIcon(),
        _ => Icon(
            Icons.save,
            color: canSave ? Colors.white : Colors.grey,
          ),
      },
    );
  }
}

class _LoadingIcon extends StatelessWidget {
  const _LoadingIcon();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: Dimentions.spacingMedium,
      width: Dimentions.spacingMedium,
      child: CircularProgressIndicator(
        color: AppColors.white,
        strokeWidth: 2,
      ),
    );
  }
}
