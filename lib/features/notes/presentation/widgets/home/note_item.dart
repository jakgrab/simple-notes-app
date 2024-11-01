import 'package:flutter/material.dart';
import 'package:simple_notes_app/features/notes/domain/entities/note.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.brown[200],
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(blurRadius: 1),
        ],
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(note.content, style: const TextStyle(fontSize: 16)),
          Align(alignment: Alignment.bottomRight, child: Text(note.creationDate.toString())),
        ],
      ),
    );
  }
}
