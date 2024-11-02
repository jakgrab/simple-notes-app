import 'package:simple_notes_app/features/notes/data/models/note/note_model.dart';

abstract interface class NotesDaoInterface {
  Future<List<NoteModel>> getNotes();
  Future<NoteModel?> getNote(String noteId);
  Future<void> addNote(NoteModel note);
  Future<void> deleteNote(NoteModel note);
  Future<void> updateNote(NoteModel note);
}
