import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:simple_notes_app/features/notes/domain/repository/notes_repository.dart';
import 'package:simple_notes_app/features/notes/domain/usecases/get_note.dart';

import '../../../../helpers/mocked_constants.dart';
import 'get_note_test.mocks.dart';

@GenerateNiceMocks([MockSpec<NotesRepository>()])
void main() {
  late MockNotesRepository mockNotesRepository;
  late GetNoteUseCase getNoteUseCase;

  setUp(() {
    mockNotesRepository = MockNotesRepository();
    getNoteUseCase = GetNoteUseCase(mockNotesRepository);
  });

  test('should return Note when the note is found', () async {
    // arrange
    final noteId = MockedConstants.mockNote.id;
    final note = MockedConstants.mockNote;

    when(mockNotesRepository.getNote(noteId)).thenAnswer((_) async => note);

    // act
    final result = await getNoteUseCase.call(params: noteId);

    // assert
    verify(mockNotesRepository.getNote(noteId)).called(1);
    expect(result, equals(note));
  });

  test('should return null when the note is not found', () async {
    // arrange
    final noteId = MockedConstants.mockNote.id;
    when(mockNotesRepository.getNote(noteId)).thenAnswer((_) async => null);

    // act
    final result = await getNoteUseCase.call(params: noteId);

    // assert
    verify(mockNotesRepository.getNote(noteId)).called(1);
    expect(result, isNull);
  });

  test('should return null when an exception is thrown', () async {
    // arrange
    final noteId = MockedConstants.mockNote.id;
    when(mockNotesRepository.getNote(noteId)).thenThrow(Exception('Database error'));

    // act
    final result = await getNoteUseCase.call(params: noteId);

    // assert
    verify(mockNotesRepository.getNote(noteId)).called(1);
    expect(result, isNull);
  });
}
