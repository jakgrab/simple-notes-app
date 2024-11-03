import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:simple_notes_app/core/enums/data_status/data_status.dart';
import 'package:simple_notes_app/features/notes/domain/usecases/get_note.dart';
import 'package:simple_notes_app/features/notes/domain/usecases/update_note.dart';
import 'package:simple_notes_app/features/notes/presentation/bloc/update_note/update_note_state.dart';

sealed class UpdateNoteCubitEvent {}

class NoteEmpty extends UpdateNoteCubitEvent {}

class NoNoteFound extends UpdateNoteCubitEvent {}

class ErrorUpdatingNote extends UpdateNoteCubitEvent {}

class UpdateNoteSuccess extends UpdateNoteCubitEvent {}

@injectable
class UpdateNoteCubit extends Cubit<UpdateNoteState> with BlocPresentationMixin<UpdateNoteState, UpdateNoteCubitEvent> {
  UpdateNoteCubit(
    this._getNoteUseCase,
    this._updateNoteUseCase,
  ) : super(UpdateNoteState());

  final GetNoteUseCase _getNoteUseCase;
  final UpdateNoteUseCase _updateNoteUseCase;

  Future<void> init(String? noteId) async {
    emit(state.copyWith(status: DataStatus.loading));
    if (noteId == null) return;

    final note = await _getNoteUseCase.call(params: noteId);

    if (note == null) {
      emit(state.copyWith(status: DataStatus.error));
      emitPresentation(NoNoteFound());
      return;
    }

    emit(state.copyWith(status: DataStatus.success, note: note));
  }

  void onNoteContentChanged(String content) {
    emit(state.copyWith(noteContent: content));
  }

  Future<void> updateNote() async {
    emit(state.copyWith(status: DataStatus.loading));
    final currentNote = state.note;

    if (currentNote == null) {
      emit(state.copyWith(status: DataStatus.error));
      emitPresentation(ErrorUpdatingNote());
      return;
    }

    final newContent = state.noteContent;

    if (newContent.isEmpty) {
      emitPresentation(NoteEmpty());
      emit(state.copyWith(status: DataStatus.error));
      return;
    }

    final updatedNote = currentNote.copyWith(content: newContent);

    final didAddNote = await _updateNoteUseCase.call(params: updatedNote);

    if (!didAddNote) {
      emit(state.copyWith(status: DataStatus.error));
      emitPresentation(ErrorUpdatingNote());
      return;
    }

    emit(state.copyWith(status: DataStatus.success));
    emitPresentation(UpdateNoteSuccess());
  }
}
