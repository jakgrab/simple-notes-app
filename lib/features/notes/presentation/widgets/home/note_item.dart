import 'package:flutter/material.dart';
import 'package:simple_notes_app/core/constants/colors.dart';
import 'package:simple_notes_app/core/constants/date_formats.dart';
import 'package:simple_notes_app/core/extensions/format_on_date_time.dart';
import 'package:simple_notes_app/features/notes/domain/entities/note.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightBrown,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowBlack,
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(note.content, style: const TextStyle(fontSize: 16)),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              note.creationDate.formatDate(DateFormats.HH_mm_dd_MM_yyyy),
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
