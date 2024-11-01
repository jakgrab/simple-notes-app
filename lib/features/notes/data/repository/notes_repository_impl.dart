import 'package:injectable/injectable.dart';
import 'package:simple_notes_app/features/notes/data/data_sources/local/daos/notes_dao_interface.dart';
import 'package:simple_notes_app/features/notes/data/models/note/note_model.dart';
import 'package:simple_notes_app/features/notes/domain/entities/note.dart';
import 'package:simple_notes_app/features/notes/domain/repository/notes_repository.dart';

@LazySingleton(as: NotesRepository)
class NotesRepositoryImpl implements NotesRepository {
  NotesRepositoryImpl(this._notesDao);

  final NotesDaoInterface _notesDao;

  @override
  Future<void> addNote(Note note) async {
    await _notesDao.addNote(NoteModel.fromNote(note));
  }

  @override
  Future<void> deleteNote(Note note) async {
    await _notesDao.deleteNote(NoteModel.fromNote(note));
  }

  @override
  Future<List<Note>> getNotes() async {
    final notesFromDb = await _notesDao.getNotes();

    final notes = notesFromDb.map((e) => Note.fromNoteModel(e)).toList();

    notes.sort((a, b) => a.creationDate.isBefore(b.creationDate) ? 1 : 0);

    return notes;
  }
}
