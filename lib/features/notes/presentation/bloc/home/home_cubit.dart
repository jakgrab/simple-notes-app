import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:simple_notes_app/core/enums/data_status/data_status.dart';
import 'package:simple_notes_app/features/notes/domain/entities/note.dart';
import 'package:simple_notes_app/features/notes/domain/usecases/get_notes.dart';
import 'package:simple_notes_app/features/notes/domain/usecases/remove_note.dart';
import 'package:simple_notes_app/features/notes/presentation/bloc/home/home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this._getNotesUseCase,
    this._removeNoteUseCase,
  ) : super(HomeState());

  final GetNotesUseCase _getNotesUseCase;
  final RemoveNoteUseCase _removeNoteUseCase;

  Future<void> init() async {
    await getNotes();
  }

  Future<void> getNotes() async {
    emit(state.copyWith(status: DataStatus.loading));

    final notes = await _getNotesUseCase.call();

    emit(state.copyWith(status: DataStatus.success, notes: notes));
  }

  Future<void> removeNote(Note note) async {
    final didRemove = await _removeNoteUseCase.call(params: note);

    if (!didRemove) return;

    final notes = [...state.notes];

    final updatedNotes = notes..remove(note);

    emit(state.copyWith(notes: updatedNotes));
  }
}
