import 'dart:io';

extension FileExtension on File {
  String? getFileName() {
    String fileName = path.split('/').last;
    return fileName.split('.').first;
  }

  String? getExtension() {
    String fileName = path.split('/').last;
    return fileName.split('.').last;
  }

  String? getFullName() {
    return path.split('/').last;
  }
}
