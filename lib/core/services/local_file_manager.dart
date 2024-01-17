import 'dart:io';

import 'package:markdown_editor/core/services/file_manager.dart';

class LocalFileManger implements FileManager {
  static final homePath =
      Platform.environment['HOME'] ?? Platform.environment['USERPROFILE'];

  @override
  void createFile(String title) {
    File file = File('$homePath\\Desktop\\Testing\\$title.md');
    file.writeAsString("");
  }

  @override
  void deleteFile(File file) {
    // TODO: implement deleteFile
  }

  @override
  void modifyFile(File file) {
    // TODO: implement modifyFile
  }

  @override
  void findFile(String title) {
    // TODO: implement findFile
  }
}
