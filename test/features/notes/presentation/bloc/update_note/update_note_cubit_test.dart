import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:simple_notes_app/core/enums/data_status/data_status.dart';
import 'package:simple_notes_app/features/notes/domain/usecases/get_note.dart';
import 'package:simple_notes_app/features/notes/domain/usecases/update_note.dart';
import 'package:simple_notes_app/features/notes/presentation/bloc/update_note/update_note_cubit.dart';
import 'package:simple_notes_app/features/notes/presentation/bloc/update_note/update_note_state.dart';

import '../../../../../helpers/mocked_constants.dart';
import 'update_note_cubit_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<GetNoteUseCase>(),
  MockSpec<UpdateNoteUseCase>(),
])
void main() {
  late UpdateNoteCubit updateNoteCubit;
  late MockGetNoteUseCase mockGetNoteUseCase;
  late MockUpdateNoteUseCase mockUpdateNoteUseCase;

  final initialLoadingState = UpdateNoteState(status: DataStatus.loading);
  final noteFetchedState = UpdateNoteState(
    status: DataStatus.success,
    note: MockedConstants.mockNote,
  );
  final updatedNoteContentState = noteFetchedState.copyWith(
    noteContent: MockedConstants.updatedNoteContent,
  );
  final errorState = UpdateNoteState(status: DataStatus.error);

  setUp(() {
    mockGetNoteUseCase = MockGetNoteUseCase();
    mockUpdateNoteUseCase = MockUpdateNoteUseCase();
    updateNoteCubit = UpdateNoteCubit(mockGetNoteUseCase, mockUpdateNoteUseCase);
  });

  tearDown(() {
    updateNoteCubit.close();
  });

  group('UpdateNoteCubit', () {
    blocTest<UpdateNoteCubit, UpdateNoteState>(
      'emits [loading, success] when init is called with a valid noteId',
      build: () {
        when(mockGetNoteUseCase.call(params: MockedConstants.mockNote.id))
            .thenAnswer((_) async => MockedConstants.mockNote);
        return updateNoteCubit;
      },
      act: (cubit) => cubit.init(MockedConstants.mockNote.id),
      expect: () => [initialLoadingState, noteFetchedState],
    );

    blocTest<UpdateNoteCubit, UpdateNoteState>(
      'emits [loading, error, NoNoteFound] when init is called with an invalid noteId',
      build: () {
        when(mockGetNoteUseCase.call(params: 'invalid_id')).thenAnswer((_) async => null);
        return updateNoteCubit;
      },
      act: (cubit) => cubit.init('invalid_id'),
      expect: () => [initialLoadingState, errorState],
    );

    blocTest<UpdateNoteCubit, UpdateNoteState>(
      'updates note content when onNoteContentChanged is called',
      build: () => updateNoteCubit,
      act: (cubit) => cubit.onNoteContentChanged(MockedConstants.updatedNoteContent),
      expect: () => [
        updateNoteCubit.state.copyWith(noteContent: MockedConstants.updatedNoteContent),
      ],
    );

    blocTest<UpdateNoteCubit, UpdateNoteState>(
      'emits [loading, success, UpdateNoteSuccess] when updateNote is called with valid content',
      build: () {
        when(mockGetNoteUseCase.call(params: MockedConstants.mockNote.id))
            .thenAnswer((_) async => MockedConstants.mockNote);
        when(
          mockUpdateNoteUseCase.call(
            params: MockedConstants.mockNote.copyWith(content: MockedConstants.updatedNoteContent),
          ),
        ).thenAnswer((_) async => true);

        return updateNoteCubit;
      },
      act: (cubit) async {
        await cubit.init(MockedConstants.mockNote.id);
        cubit.onNoteContentChanged(MockedConstants.updatedNoteContent);
        await cubit.updateNote();
      },
      expect: () => [
        initialLoadingState,
        noteFetchedState,
        updatedNoteContentState,
        initialLoadingState.copyWith(note: MockedConstants.mockNote, noteContent: MockedConstants.updatedNoteContent),
        updatedNoteContentState,
      ],
    );

    blocTest<UpdateNoteCubit, UpdateNoteState>(
      'emits [loading, error, ErrorUpdatingNote] when updateNote is called with no current note',
      build: () => updateNoteCubit,
      act: (cubit) => cubit.updateNote(),
      expect: () => [initialLoadingState, errorState],
    );

    blocTest<UpdateNoteCubit, UpdateNoteState>(
      'emits [loading, error, NoteEmpty] when updateNote is called with empty content',
      build: () {
        when(mockGetNoteUseCase.call(params: MockedConstants.mockNote.id))
            .thenAnswer((_) async => MockedConstants.mockNote);
        return updateNoteCubit;
      },
      act: (cubit) async {
        await cubit.init(MockedConstants.mockNote.id);
        cubit.onNoteContentChanged('');
        await cubit.updateNote();
      },
      expect: () => [
        initialLoadingState,
        noteFetchedState.copyWith(noteContent: ''),
        initialLoadingState.copyWith(note: MockedConstants.mockNote, noteContent: ''),
        errorState.copyWith(note: MockedConstants.mockNote, noteContent: ''),
      ],
      verify: (cubit) => verifyNever(mockUpdateNoteUseCase.call(params: MockedConstants.mockNote)),
    );

    blocTest<UpdateNoteCubit, UpdateNoteState>(
      'emits [loading, error, ErrorUpdatingNote] when updateNote fails',
      build: () {
        when(mockGetNoteUseCase.call(params: MockedConstants.mockNote.id))
            .thenAnswer((_) async => MockedConstants.mockNote);
        when(
          mockUpdateNoteUseCase.call(
            params: MockedConstants.mockNote.copyWith(content: MockedConstants.updatedNoteContent),
          ),
        ).thenAnswer((_) async => false);

        return updateNoteCubit;
      },
      act: (cubit) async {
        await cubit.init(MockedConstants.mockNote.id);
        cubit.onNoteContentChanged(MockedConstants.updatedNoteContent);
        await cubit.updateNote();
      },
      expect: () => [
        initialLoadingState,
        noteFetchedState,
        updatedNoteContentState,
        initialLoadingState.copyWith(note: MockedConstants.mockNote, noteContent: MockedConstants.updatedNoteContent),
        errorState.copyWith(note: MockedConstants.mockNote, noteContent: MockedConstants.updatedNoteContent),
      ],
      verify: (_) {
        verify(
          mockUpdateNoteUseCase.call(
            params: MockedConstants.mockNote.copyWith(content: MockedConstants.updatedNoteContent),
          ),
        ).called(1);
      },
    );
  });
}
