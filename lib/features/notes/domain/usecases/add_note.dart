import 'package:injectable/injectable.dart';
import 'package:simple_notes_app/core/usecase/usecase.dart';
import 'package:simple_notes_app/features/notes/domain/entities/note.dart';
import 'package:simple_notes_app/features/notes/domain/repository/notes_repository.dart';

@lazySingleton
class AddNoteUseCase implements UseCase<bool, Note> {
  AddNoteUseCase(this._notesRepository);

  final NotesRepository _notesRepository;

  @override
  Future<bool> call({required Note params}) async {
    try {
      await _notesRepository.addNote(params);
      return true;
    } catch (e) {
      return false;
    }
  }
}
