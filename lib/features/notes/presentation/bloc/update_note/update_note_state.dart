import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_notes_app/core/enums/data_status/data_status.dart';
import 'package:simple_notes_app/features/notes/domain/entities/note.dart';

part 'update_note_state.freezed.dart';

@freezed
class UpdateNoteState with _$UpdateNoteState {
  factory UpdateNoteState({
    Note? note,
    @Default('') String noteContent,
    @Default(DataStatus.initial) DataStatus status,
  }) = _UpdateNoteState;
}
