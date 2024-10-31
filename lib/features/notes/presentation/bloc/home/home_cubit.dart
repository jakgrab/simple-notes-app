import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_notes_app/core/enums/data_status/data_status.dart';
import 'package:simple_notes_app/features/notes/domain/usecases/get_notes.dart';
import 'package:simple_notes_app/features/notes/presentation/bloc/home/home_state.dart';

@factory
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._getNotesUseCase) : super(HomeState());

  final GetNotesUseCase _getNotesUseCase;

  Future<void> init() async {
    emit(state.copyWith(status: DataStatus.loading));

    final notes = await _getNotesUseCase.call();

    emit(state.copyWith(status: DataStatus.success, notes: notes));
  }
}
