import 'package:go_router/go_router.dart';
import 'package:simple_notes_app/config/routing/path_params.dart';
import 'package:simple_notes_app/core/constants/route_names.dart';
import 'package:simple_notes_app/features/notes/presentation/pages/add_note_screen/add_note_screen.dart';
import 'package:simple_notes_app/features/notes/presentation/pages/home_screen/home_screen.dart';
import 'package:simple_notes_app/features/notes/presentation/pages/update_note_screen/update_note_screen.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/${RouteNames.home}',
  routes: [
    _homeRoute,
    _addNoteRoute,
    _updateNoteRoute,
  ],
);

final _homeRoute = GoRoute(
  path: '/${RouteNames.home}',
  name: RouteNames.home,
  builder: (context, state) => const HomeScreen(),
);

final _addNoteRoute = GoRoute(
  path: '/${RouteNames.addNote}',
  name: RouteNames.addNote,
  builder: (context, state) => const AddNoteScreen(),
);

final _updateNoteRoute = GoRoute(
  path: '/${RouteNames.updateNote}/:${PathParams.noteId}',
  name: RouteNames.updateNote,
  builder: (context, state) {
    final noteId = state.pathParameters[PathParams.noteId];

    return UpdateNoteScreen(noteId: noteId);
  },
);
