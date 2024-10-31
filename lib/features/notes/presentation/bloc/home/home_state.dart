import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_notes_app/core/enums/data_status/data_status.dart';
import 'package:simple_notes_app/features/notes/domain/entities/note.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    @Default(DataStatus.initial) DataStatus status,
    @Default([]) List<Note> notes,
  }) = _HomeState;
}
