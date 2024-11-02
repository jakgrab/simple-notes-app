import 'package:injectable/injectable.dart';
import 'package:simple_notes_app/core/usecase/usecase.dart';
import 'package:simple_notes_app/features/notes/domain/entities/note.dart';
import 'package:simple_notes_app/features/notes/domain/repository/notes_repository.dart';

@lazySingleton
class UpdateNoteUseCase implements UseCase<bool, Note> {
  UpdateNoteUseCase(this._notesRepository);

  final NotesRepository _notesRepository;

  @override
  Future<bool> call({required Note params}) async {
    try {
      await _notesRepository.updateNote(params);
      return true;
    } catch (e) {
      return false;
    }
  }
}
