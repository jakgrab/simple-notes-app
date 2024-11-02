import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:simple_notes_app/core/constants/hive_boxes.dart';
import 'package:simple_notes_app/features/notes/data/data_sources/local/daos/notes_dao_interface.dart';
import 'package:simple_notes_app/features/notes/data/models/note/note_model.dart';

@LazySingleton(as: NotesDaoInterface)
class NotesDao implements NotesDaoInterface {
  @override
  Future<void> addNote(NoteModel note) async {
    final notesBox = await Hive.openBox<NoteModel>(HiveBoxes.notes);

    await notesBox.put(note.id, note);
  }

  @override
  Future<void> deleteNote(NoteModel note) async {
    final notesBox = await Hive.openBox<NoteModel>(HiveBoxes.notes);

    await notesBox.delete(note.id);
  }

  @override
  Future<List<NoteModel>> getNotes() async {
    final notesBox = await Hive.openBox<NoteModel>(HiveBoxes.notes);

    return notesBox.values.toList();
  }

  @override
  Future<void> updateNote(NoteModel note) async {
    final notesBox = await Hive.openBox<NoteModel>(HiveBoxes.notes);

    await notesBox.put(note.id, note);
  }

  @override
  Future<NoteModel?> getNote(String noteId) async {
    final notesBox = await Hive.openBox<NoteModel>(HiveBoxes.notes);

    final note = notesBox.get(noteId);

    return note;
  }
}
