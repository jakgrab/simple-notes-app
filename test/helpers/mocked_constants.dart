import 'package:simple_notes_app/features/notes/domain/entities/note.dart';

abstract class MockedConstants {
  static final mockNote = Note(
    id: 'mock-uuid',
    content: 'hello world',
    creationDate: DateTime(2024, 11, 1, 12),
  );

  static const updatedNoteContent = 'Updated note content';
}
