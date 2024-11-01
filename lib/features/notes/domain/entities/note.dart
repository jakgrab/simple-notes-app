import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_notes_app/features/notes/data/models/note/note_model.dart';

part 'note.freezed.dart';
part 'note.g.dart';

@freezed
class Note with _$Note {
  factory Note({
    required String id,
    @Default('') String content,
    required DateTime creationDate,
  }) = _Note;

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);

  factory Note.fromNoteModel(NoteModel noteModel) => Note(
        id: noteModel.id,
        content: noteModel.content,
        creationDate: noteModel.creationDate,
      );
}
