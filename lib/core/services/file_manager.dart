import 'package:markdown_editor/models/note.dart';

abstract class FileManager {
  void createFile(String title);

  Note readFile(String title);

  void deleteFile(String title);

  void modifyFile(String title, String content);
}
