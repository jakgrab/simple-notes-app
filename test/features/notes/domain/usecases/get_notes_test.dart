import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:simple_notes_app/features/notes/domain/repository/notes_repository.dart';
import 'package:simple_notes_app/features/notes/domain/usecases/get_notes.dart';

import '../../../../helpers/mocked_constants.dart';
import 'get_notes_test.mocks.dart';

@GenerateMocks([NotesRepository])
void main() {
  late MockNotesRepository mockNotesRepository;
  late GetNotesUseCase getNotesUseCase;

  setUp(() {
    mockNotesRepository = MockNotesRepository();
    getNotesUseCase = GetNotesUseCase(mockNotesRepository);
  });

  test('should return notes from repository', () async {
    // arrange
    final notes = [
      MockedConstants.mockNote,
      MockedConstants.mockNote.copyWith(id: 'changed id', content: 'changed content', creationDate: DateTime.now()),
    ];

    when(mockNotesRepository.getNotes()).thenAnswer((_) async => notes);

    // act
    final result = await getNotesUseCase.call();

    // assert
    verify(mockNotesRepository.getNotes()).called(1);
    expect(result, equals(notes));
  });

  test('should return empty list if repository throws error', () async {
    // arrange
    when(mockNotesRepository.getNotes()).thenThrow(Exception('Mock error'));

    // act
    final result = await getNotesUseCase.call();

    // assert
    verify(mockNotesRepository.getNotes()).called(1);
    expect(result, isEmpty);
  });
}
