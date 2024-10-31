import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.brown[200], borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.all(16.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Note title',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          Text('Note description', style: TextStyle(fontSize: 16)),
          Align(alignment: Alignment.bottomRight, child: Text('Date')),
        ],
      ),
    );
  }
}
