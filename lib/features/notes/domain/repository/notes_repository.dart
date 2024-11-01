import 'package:simple_notes_app/features/notes/domain/entities/note.dart';

abstract interface class NotesRepository {
  Future<List<Note>> getNotes();
  Future<void> addNote(Note note);
  Future<void> deleteNote(Note note);
}
