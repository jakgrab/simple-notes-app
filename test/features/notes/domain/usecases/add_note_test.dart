import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:simple_notes_app/features/notes/domain/entities/note.dart';
import 'package:simple_notes_app/features/notes/domain/repository/notes_repository.dart';
import 'package:simple_notes_app/features/notes/domain/usecases/add_note.dart';

import 'add_note_test.mocks.dart';

@GenerateMocks([NotesRepository])
void main() {
  late MockNotesRepository mockNotesRepository;
  late AddNoteUseCase addNoteUseCase;

  setUp(() {
    mockNotesRepository = MockNotesRepository();
    addNoteUseCase = AddNoteUseCase(mockNotesRepository);
  });

  test('should add note to repository', () async {
    // arrange
    final note = Note(id: '123', content: 'Hello World', creationDate: DateTime.now());
    when(mockNotesRepository.addNote(note)).thenAnswer((_) async => true);

    // act
    final result = await addNoteUseCase.call(params: note);

    // assert
    verify(mockNotesRepository.addNote(note)).called(1);
    expect(result, true);
  });

  test('should return false if adding note fails', () async {
    // arrange
    final note = Note(id: '123', content: 'Hello World', creationDate: DateTime.now());
    when(mockNotesRepository.addNote(note)).thenThrow((_) => Exception());

    // act
    final result = await addNoteUseCase.call(params: note);

    // assert
    verify(mockNotesRepository.addNote(note)).called(1);
    expect(result, false);
  });
}
