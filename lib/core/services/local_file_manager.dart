import 'dart:io';

import 'package:markdown_editor/core/services/file_manager.dart';
import 'package:markdown_editor/models/note.dart';

class LocalFileManger implements FileManager {
  static final homePath =
      Platform.environment['HOME'] ?? Platform.environment['USERPROFILE'];

  @override
  void createFile(String title) {
    File file = File('$homePath\\Desktop\\Testing\\$title.md');
    file.writeAsString("");
  }

  @override
  Note readFile(String title) {
    final file = _findFile(title);
    if (file != null) {
      String title = file.path.split('\\').last.split('.').first;
      String content = file.readAsStringSync();
      DateTime lastModified = file.lastModifiedSync();
      DateTime createdAt = file.statSync().changed;

      return Note(title, content, createdAt, lastModified);
    }
    throw Exception("file not found");
  }

  @override
  void deleteFile(String title) {
    // TODO: implement deleteFile
  }

  @override
  void modifyFile(String title, String content) {
    final file = _findFile(title);
    if (file != null) {
      file.writeAsStringSync(content);
    }
  }

  File? _findFile(String title) {
    Directory directory = Directory('$homePath\\Desktop\\Testing\\');
    List<FileSystemEntity> files = directory.listSync(recursive: true);

    File? foundFile;
    for (var file in files) {
      if (file is File && file.path.split('\\').last == '$title.md') {
        foundFile = file;
        break;
      }
    }

    if (foundFile != null) {
      // File found
      return foundFile;
    } else {
      return null;
    }
  }
}
