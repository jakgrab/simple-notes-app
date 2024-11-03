import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:simple_notes_app/features/notes/domain/repository/notes_repository.dart';
import 'package:simple_notes_app/features/notes/domain/usecases/update_note.dart';

import '../../../../helpers/mocked_constants.dart';
import 'update_note_test.mocks.dart';

@GenerateNiceMocks([MockSpec<NotesRepository>()])
void main() {
  late MockNotesRepository mockNotesRepository;
  late UpdateNoteUseCase updateNoteUseCase;

  setUp(() {
    mockNotesRepository = MockNotesRepository();
    updateNoteUseCase = UpdateNoteUseCase(mockNotesRepository);
  });

  test('should return true when note is successfully updated', () async {
    // arrange
    final note = MockedConstants.mockNote;

    when(mockNotesRepository.updateNote(note)).thenAnswer((_) async => Future.value());

    // act
    final result = await updateNoteUseCase.call(params: note);

    // assert
    verify(mockNotesRepository.updateNote(note)).called(1);
    expect(result, true);
  });

  test('should return false when updating note throws an exception', () async {
    // arrange
    final note = MockedConstants.mockNote;
    when(mockNotesRepository.updateNote(note)).thenThrow(Exception('Database error'));

    // act
    final result = await updateNoteUseCase.call(params: note);

    // assert
    verify(mockNotesRepository.updateNote(note)).called(1);
    expect(result, false);
  });
}
