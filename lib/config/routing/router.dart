import 'package:go_router/go_router.dart';
import 'package:simple_notes_app/core/constants/route_names.dart';
import 'package:simple_notes_app/features/notes/presentation/pages/add_note_screen/add_note_screen.dart';
import 'package:simple_notes_app/features/notes/presentation/pages/home_screen/home_screen.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/',
  routes: [
    _homeRoute,
    _addNoteRoute,
  ],
);

final _homeRoute = GoRoute(
  path: '/',
  name: RouteNames.home,
  builder: (context, state) => const HomeScreen(),
);

final _addNoteRoute = GoRoute(
  path: '/add-note',
  name: RouteNames.addNote,
  builder: (context, state) => const AddNoteScreen(),
);
