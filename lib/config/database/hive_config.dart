import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simple_notes_app/features/notes/data/models/note/note_model.dart';

Future<void> initHiveDatabase() async {
  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  _registerHiveAdapters();
}

void _registerHiveAdapters() {
  Hive.registerAdapter(NoteModelAdapter(), override: true);
}
