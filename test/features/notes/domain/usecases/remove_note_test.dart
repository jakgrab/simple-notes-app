import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:simple_notes_app/features/notes/domain/repository/notes_repository.dart';
import 'package:simple_notes_app/features/notes/domain/usecases/remove_note.dart';

import '../../../../helpers/mocked_constants.dart';
import 'remove_note_test.mocks.dart';

@GenerateNiceMocks([MockSpec<NotesRepository>()])
void main() {
  late MockNotesRepository mockNotesRepository;
  late RemoveNoteUseCase removeNoteUseCase;

  setUp(() {
    mockNotesRepository = MockNotesRepository();
    removeNoteUseCase = RemoveNoteUseCase(mockNotesRepository);
  });

  test('should return true when note is successfully deleted', () async {
    // arrange
    final note = MockedConstants.mockNote;
    when(mockNotesRepository.deleteNote(note)).thenAnswer((_) async => Future.value());

    // act
    final result = await removeNoteUseCase.call(params: note);

    // assert
    verify(mockNotesRepository.deleteNote(note)).called(1);
    expect(result, true);
  });

  test('should return false when deleting note throws an exception', () async {
    // arrange
    final note = MockedConstants.mockNote;
    when(mockNotesRepository.deleteNote(note)).thenThrow(Exception('Database error'));

    // act
    final result = await removeNoteUseCase.call(params: note);

    // assert
    verify(mockNotesRepository.deleteNote(note)).called(1);
    expect(result, false);
  });
}
