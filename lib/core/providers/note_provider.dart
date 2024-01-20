import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:markdown_editor/core/services/local_file_manager.dart';
import 'package:markdown_editor/models/note.dart';

class NoteNotifier extends StateNotifier<Note> {
  //TODO make the first note is the last note was opened
  NoteNotifier()
      : super(Note("title", "test test test **test**", DateTime.now(),
            DateTime.now()));

  final fileManager = LocalFileManger();

  void readNote(String title) {
    state = fileManager.readFile(title);
  }

  void writeOnFile(String title, String content) {
    fileManager.modifyFile(title, content);
  }
}

final noteProvider = StateNotifierProvider<NoteNotifier, Note>(
  (ref) => NoteNotifier(),
);
