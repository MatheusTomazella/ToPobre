import 'dart:io';

import 'package:path_provider/path_provider.dart';

class DatabaseService {
  static Future<String> getDatabasePath() async {
    return (await getApplicationDocumentsDirectory()).path;
  }

  static Future<File> getFileReference(String databaseName) async {
    return File(await getDatabasePath() + '/$databaseName.json');
  }

  static Future<File> save(String serializedString, String databaseName) async {
    final File file = await getFileReference(databaseName);
    return file.writeAsString(serializedString);
  }

  static Future<String> load(String databaseName) async {
    final File file = await getFileReference(databaseName);
    return file.readAsStringSync();
  }
}
