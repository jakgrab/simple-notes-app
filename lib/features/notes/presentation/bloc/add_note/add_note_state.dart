import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_notes_app/core/enums/data_status/data_status.dart';

part 'add_note_state.freezed.dart';

@freezed
class AddNoteState with _$AddNoteState {
  factory AddNoteState({
    @Default('') String noteContent,
    @Default(DataStatus.initial) DataStatus status,
  }) = _AddNoteState;
}
