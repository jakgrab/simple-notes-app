// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:simple_notes_app/features/notes/data/data_sources/local/daos/notes_dao.dart'
    as _i609;
import 'package:simple_notes_app/features/notes/data/data_sources/local/daos/notes_dao_interface.dart'
    as _i348;
import 'package:simple_notes_app/features/notes/data/repository/notes_repository_impl.dart'
    as _i45;
import 'package:simple_notes_app/features/notes/domain/repository/notes_repository.dart'
    as _i1072;
import 'package:simple_notes_app/features/notes/domain/usecases/add_note.dart'
    as _i748;
import 'package:simple_notes_app/features/notes/domain/usecases/get_notes.dart'
    as _i855;
import 'package:simple_notes_app/features/notes/presentation/bloc/add_note/add_note_cubit.dart'
    as _i159;
import 'package:simple_notes_app/features/notes/presentation/bloc/home/home_cubit.dart'
    as _i34;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i348.NotesDaoInterface>(() => _i609.NotesDao());
    gh.lazySingleton<_i1072.NotesRepository>(
        () => _i45.NotesRepositoryImpl(gh<_i348.NotesDaoInterface>()));
    gh.lazySingleton<_i748.AddNoteUseCase>(
        () => _i748.AddNoteUseCase(gh<_i1072.NotesRepository>()));
    gh.lazySingleton<_i855.GetNotesUseCase>(
        () => _i855.GetNotesUseCase(gh<_i1072.NotesRepository>()));
    gh.factory<_i159.AddNoteCubit>(
        () => _i159.AddNoteCubit(gh<_i748.AddNoteUseCase>()));
    gh.factory<_i34.HomeCubit>(
        () => _i34.HomeCubit(gh<_i855.GetNotesUseCase>()));
    return this;
  }
}