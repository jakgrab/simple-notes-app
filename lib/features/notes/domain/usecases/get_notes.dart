import 'package:injectable/injectable.dart';
import 'package:simple_notes_app/core/usecase/usecase.dart';
import 'package:simple_notes_app/features/notes/domain/entities/note.dart';
import 'package:simple_notes_app/features/notes/domain/repository/notes_repository.dart';

@lazySingleton
class GetNotesUseCase implements UseCase<List<Note>, void> {
  GetNotesUseCase(this._notesRepository);

  final NotesRepository _notesRepository;

  @override
  Future<List<Note>> call({void params}) async {
    try {
      return await _notesRepository.getNotes();
    } catch (e) {
      return [];
    }
  }
}
