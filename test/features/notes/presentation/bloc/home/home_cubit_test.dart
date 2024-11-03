import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:simple_notes_app/core/enums/data_status/data_status.dart';
import 'package:simple_notes_app/features/notes/domain/usecases/get_notes.dart';
import 'package:simple_notes_app/features/notes/domain/usecases/remove_note.dart';
import 'package:simple_notes_app/features/notes/presentation/bloc/home/home_cubit.dart';
import 'package:simple_notes_app/features/notes/presentation/bloc/home/home_state.dart';

import '../../../../../helpers/mocked_constants.dart';
import 'home_cubit_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<GetNotesUseCase>(),
  MockSpec<RemoveNoteUseCase>(),
])
void main() {
  late HomeCubit homeCubit;
  late MockGetNotesUseCase mockGetNotesUseCase;
  late MockRemoveNoteUseCase mockRemoveNoteUseCase;

  setUp(() {
    mockGetNotesUseCase = MockGetNotesUseCase();
    mockRemoveNoteUseCase = MockRemoveNoteUseCase();
    homeCubit = HomeCubit(mockGetNotesUseCase, mockRemoveNoteUseCase);
  });

  tearDown(() {
    homeCubit.close();
  });

  group('HomeCubit', () {
    blocTest<HomeCubit, HomeState>(
      'emits [loading, success] when getNotes is called',
      build: () {
        when(mockGetNotesUseCase.call()).thenAnswer((_) async => [MockedConstants.mockNote]);
        return homeCubit;
      },
      act: (cubit) => cubit.getNotes(),
      expect: () => [
        homeCubit.state.copyWith(
          status: DataStatus.loading,
          notes: [],
        ),
        homeCubit.state.copyWith(
          status: DataStatus.success,
          notes: [MockedConstants.mockNote],
        ),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'emits [success] when removeNote is called with a valid note',
      build: () {
        when(mockRemoveNoteUseCase.call(params: MockedConstants.mockNote)).thenAnswer((_) async => true);
        homeCubit.emit(homeCubit.state.copyWith(notes: [MockedConstants.mockNote]));
        return homeCubit;
      },
      act: (cubit) => cubit.removeNote(MockedConstants.mockNote),
      expect: () => [
        homeCubit.state.copyWith(notes: []), // Expect the notes to be updated
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'does not emit new state when removeNote is called with a note that was not removed',
      build: () {
        when(mockRemoveNoteUseCase.call(params: MockedConstants.mockNote)).thenAnswer((_) async => false);
        homeCubit.emit(homeCubit.state.copyWith(notes: [MockedConstants.mockNote]));
        return homeCubit;
      },
      act: (cubit) => cubit.removeNote(MockedConstants.mockNote),
      expect: () => [],
    );
  });
}
