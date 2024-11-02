import 'package:injectable/injectable.dart';
import 'package:simple_notes_app/core/usecase/usecase.dart';
import 'package:simple_notes_app/features/notes/domain/entities/note.dart';
import 'package:simple_notes_app/features/notes/domain/repository/notes_repository.dart';

@lazySingleton
class GetNoteUseCase implements UseCase<Note?, String> {
  GetNoteUseCase(this._notesRepository);

  final NotesRepository _notesRepository;

  @override
  Future<Note?> call({required String params}) async {
    try {
      return await _notesRepository.getNote(params);
    } catch (e) {
      return null;
    }
  }
}
