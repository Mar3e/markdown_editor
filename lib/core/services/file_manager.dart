import 'dart:io';

abstract class FileManager {
  void createFile(String title);

  void findFile(String title);

  void deleteFile(File file);

  void modifyFile(File file);
}
