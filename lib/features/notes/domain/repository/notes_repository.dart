import 'package:simple_notes_app/features/notes/domain/entities/note.dart';

abstract interface class NotesRepository {
  Future<List<Note>> getNotes();
  Future<Note?> getNote(String noteId);
  Future<void> addNote(Note note);
  Future<void> deleteNote(Note note);
  Future<void> updateNote(Note note);
}
