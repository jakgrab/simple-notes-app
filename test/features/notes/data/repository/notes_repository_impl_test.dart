import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:simple_notes_app/features/notes/data/data_sources/local/daos/notes_dao_interface.dart';
import 'package:simple_notes_app/features/notes/data/models/note/note_model.dart';
import 'package:simple_notes_app/features/notes/data/repository/notes_repository_impl.dart';
import 'package:simple_notes_app/features/notes/domain/entities/note.dart';

import '../../../../helpers/mocked_constants.dart';
import 'notes_repository_impl_test.mocks.dart';

@GenerateMocks([NotesDaoInterface])
void main() {
  late NotesRepositoryImpl repository;
  late MockNotesDaoInterface mockDao;

  setUp(() {
    mockDao = MockNotesDaoInterface();
    repository = NotesRepositoryImpl(mockDao);
  });

  group('addNote', () {
    test('should call addNote on dao with NoteModel', () async {
      // arrange
      final note = MockedConstants.mockNote;
      final noteModel = NoteModel.fromNote(note);

      // act
      await repository.addNote(note);

      // assert
      verify(mockDao.addNote(noteModel)).called(1);
    });
  });

  group('deleteNote', () {
    test('should call deleteNote on dao with NoteModel', () async {
      // arrange
      final note = MockedConstants.mockNote;
      final noteModel = NoteModel.fromNote(note);

      // act
      await repository.deleteNote(note);

      // assert
      verify(mockDao.deleteNote(noteModel)).called(1);
    });
  });

  group('getNotes', () {
    test('should return a sorted list of notes from dao', () async {
      // arrange
      final notesFromDao = [
        MockedConstants.mockNote,
        MockedConstants.mockNote.copyWith(content: MockedConstants.updatedNoteContent),
      ].map((note) => NoteModel.fromNote(note)).toList();

      when(mockDao.getNotes()).thenAnswer((_) async => notesFromDao);

      // act
      final result = await repository.getNotes();

      // assert
      verify(mockDao.getNotes()).called(1);
      expect(result, isA<List<Note>>());
      expect(result.length, notesFromDao.length);
      expect(result[0].content, MockedConstants.mockNote.content);
      expect(result[1].content, MockedConstants.updatedNoteContent);
    });
  });

  group('updateNote', () {
    test('should call updateNote on dao with NoteModel', () async {
      // arrange
      final noteModel = NoteModel.fromNote(MockedConstants.mockNote);

      // act
      await repository.updateNote(MockedConstants.mockNote);

      // assert
      verify(mockDao.updateNote(noteModel)).called(1);
    });
  });

  group('getNote', () {
    test('should return a Note if dao returns a NoteModel', () async {
      // arrange
      final noteModel = NoteModel.fromNote(MockedConstants.mockNote);
      when(mockDao.getNote(MockedConstants.mockNote.id)).thenAnswer((_) async => noteModel);

      // act
      final result = await repository.getNote(MockedConstants.mockNote.id);

      // assert
      verify(mockDao.getNote(MockedConstants.mockNote.id)).called(1);
      expect(result, isA<Note>());
      expect(result?.id, noteModel.id);
      expect(result?.content, noteModel.content);
    });

    test('should return null if dao returns null', () async {
      // arrange
      when(mockDao.getNote(MockedConstants.mockNote.id)).thenAnswer((_) async => null);

      // act
      final result = await repository.getNote(MockedConstants.mockNote.id);

      // assert
      verify(mockDao.getNote(MockedConstants.mockNote.id)).called(1);
      expect(result, isNull);
    });
  });
}
