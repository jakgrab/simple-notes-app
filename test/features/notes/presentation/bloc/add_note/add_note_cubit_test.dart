import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:simple_notes_app/core/enums/data_status/data_status.dart';
import 'package:simple_notes_app/core/utils/date_time_provider.dart';
import 'package:simple_notes_app/core/utils/uuid_provider.dart';
import 'package:simple_notes_app/features/notes/domain/usecases/add_note.dart';
import 'package:simple_notes_app/features/notes/presentation/bloc/add_note/add_note_cubit.dart';
import 'package:simple_notes_app/features/notes/presentation/bloc/add_note/add_note_state.dart';

import '../../../../../helpers/mocked_constants.dart';
import 'add_note_cubit_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<AddNoteUseCase>(),
  MockSpec<UuidProvider>(),
  MockSpec<DateTimeProvider>(),
])
void main() {
  late AddNoteCubit addNoteCubit;
  late MockAddNoteUseCase mockAddNoteUseCase;
  late MockUuidProvider mockUuidGenInterface;
  late MockDateTimeProvider mockDateTimeSth;

  setUp(() {
    mockAddNoteUseCase = MockAddNoteUseCase();
    mockUuidGenInterface = MockUuidProvider();
    mockDateTimeSth = MockDateTimeProvider();

    addNoteCubit = AddNoteCubit(
      mockAddNoteUseCase,
      mockUuidGenInterface,
      mockDateTimeSth,
    );
  });

  tearDown(() {
    addNoteCubit.close();
  });

  group('AddNoteCubit', () {
    test('initial state is AddNoteState()', () {
      expect(addNoteCubit.state, AddNoteState());
    });

    blocTest<AddNoteCubit, AddNoteState>(
      'emits [loading] and NoteEmpty when addNewNote is called with empty content',
      build: () {
        final cubit = AddNoteCubit(
          mockAddNoteUseCase,
          mockUuidGenInterface,
          mockDateTimeSth,
        );
        cubit.onNoteContentChanged('');
        return cubit;
      },
      act: (cubit) async {
        await cubit.addNewNote();
      },
      expect: () => [
        addNoteCubit.state.copyWith(status: DataStatus.loading),
      ],
      verify: (cubit) {
        expectLater(cubit.presentation, emitsInOrder([isA<NoteEmpty>()]));
      },
    );

    blocTest<AddNoteCubit, AddNoteState>(
      'emits [loading, success] when addNewNote is called with valid content',
      build: () {
        final cubit = AddNoteCubit(
          mockAddNoteUseCase,
          mockUuidGenInterface,
          mockDateTimeSth,
        );

        when(mockDateTimeSth.now).thenReturn(MockedConstants.mockNote.creationDate);
        when(mockUuidGenInterface.gen()).thenReturn(MockedConstants.mockNote.id);
        when(mockAddNoteUseCase.call(params: MockedConstants.mockNote)).thenAnswer((_) async => true);

        cubit.onNoteContentChanged(MockedConstants.mockNote.content);

        return cubit;
      },
      act: (cubit) => cubit.addNewNote(),
      expect: () => [
        addNoteCubit.state.copyWith(status: DataStatus.loading, noteContent: MockedConstants.mockNote.content),
        addNoteCubit.state.copyWith(status: DataStatus.success, noteContent: MockedConstants.mockNote.content),
      ],
    );

    blocTest<AddNoteCubit, AddNoteState>(
      'emits [loading, error] when addNewNote fails',
      build: () {
        final cubit = AddNoteCubit(
          mockAddNoteUseCase,
          mockUuidGenInterface,
          mockDateTimeSth,
        );

        when(mockDateTimeSth.now).thenReturn(MockedConstants.mockNote.creationDate);
        when(mockUuidGenInterface.gen()).thenReturn(MockedConstants.mockNote.id);
        when(mockAddNoteUseCase.call(params: MockedConstants.mockNote)).thenAnswer((_) async => false);

        cubit.onNoteContentChanged(MockedConstants.mockNote.content);

        return cubit;
      },
      act: (cubit) => cubit.addNewNote(),
      expect: () => [
        addNoteCubit.state.copyWith(status: DataStatus.loading, noteContent: MockedConstants.mockNote.content),
        addNoteCubit.state.copyWith(status: DataStatus.error, noteContent: MockedConstants.mockNote.content),
      ],
    );
  });
}
