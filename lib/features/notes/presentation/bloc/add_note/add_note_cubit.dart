import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:simple_notes_app/core/enums/data_status/data_status.dart';
import 'package:simple_notes_app/core/utils/date_time_provider.dart';
import 'package:simple_notes_app/core/utils/uuid_provider.dart';
import 'package:simple_notes_app/features/notes/domain/entities/note.dart';
import 'package:simple_notes_app/features/notes/domain/usecases/add_note.dart';
import 'package:simple_notes_app/features/notes/presentation/bloc/add_note/add_note_state.dart';

sealed class AddNoteCubitEvent {}

class NoteEmpty extends AddNoteCubitEvent {}

class ErrorAddingNote extends AddNoteCubitEvent {}

class AddNoteSuccess extends AddNoteCubitEvent {}

@injectable
class AddNoteCubit extends Cubit<AddNoteState> with BlocPresentationMixin<AddNoteState, AddNoteCubitEvent> {
  AddNoteCubit(
    this._addNoteUseCase,
    this._uuidGen,
    this._dateTimeSomething,
  ) : super(AddNoteState());

  final AddNoteUseCase _addNoteUseCase;
  final UuidProvider _uuidGen;
  final DateTimeProvider _dateTimeSomething;

  void onNoteContentChanged(String content) {
    emit(state.copyWith(noteContent: content));
  }

  Future<void> addNewNote() async {
    emit(state.copyWith(status: DataStatus.loading));

    final content = state.noteContent;

    if (content.isEmpty) {
      emitPresentation(NoteEmpty());
      return;
    }

    final note = Note(
      id: _uuidGen.gen(),
      creationDate: _dateTimeSomething.now,
      content: content,
    );

    final didAddNote = await _addNoteUseCase.call(params: note);

    emit(state.copyWith(status: didAddNote ? DataStatus.success : DataStatus.error));

    emitPresentation(didAddNote ? AddNoteSuccess() : ErrorAddingNote());
  }
}
