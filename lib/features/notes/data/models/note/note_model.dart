import 'package:hive/hive.dart';
import 'package:simple_notes_app/core/constants/hive_types.dart';
import 'package:simple_notes_app/features/notes/domain/entities/note.dart';

part 'note_model.g.dart';

@HiveType(typeId: HiveTypes.notesId)
class NoteModel extends HiveObject {
  NoteModel({
    required this.id,
    required this.content,
    required this.creationDate,
  });

  factory NoteModel.fromNote(Note note) {
    return NoteModel(
      id: note.id,
      content: note.content,
      creationDate: note.creationDate,
    );
  }

  @HiveField(0)
  String id;

  @HiveField(1)
  String content;

  @HiveField(2)
  DateTime creationDate;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoteModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          content == other.content &&
          creationDate == other.creationDate;

  @override
  int get hashCode => id.hashCode ^ content.hashCode ^ creationDate.hashCode;
}
