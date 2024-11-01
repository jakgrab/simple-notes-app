import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:simple_notes_app/core/enums/data_status/data_status.dart';
import 'package:simple_notes_app/features/notes/domain/usecases/get_notes.dart';
import 'package:simple_notes_app/features/notes/presentation/bloc/home/home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._getNotesUseCase) : super(HomeState());

  final GetNotesUseCase _getNotesUseCase;

  Future<void> init() async {
    await getNotes();
  }

  Future<void> getNotes() async {
    emit(state.copyWith(status: DataStatus.loading));

    final notes = await _getNotesUseCase.call();

    print('NOTE - get notes: $notes');

    emit(state.copyWith(status: DataStatus.success, notes: notes));
  }
}
