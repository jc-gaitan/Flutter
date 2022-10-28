import 'dart:io';
import 'dart:core';

import 'package:path_provider/path_provider.dart';

class Logs {
  //
  static late File _logFile;

  static late String pathFile;

  //Obtener el directorio de la aplicación
  static Future<String> _getDocsDir() async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future initializeLogging(String nameFile) async {
    pathFile = await _getDocsDir();

    _logFile = _createLogFile('$pathFile/$nameFile');
    print("PATH ======= $pathFile / $nameFile");
    final text = '${DateTime.now()}: LOGGING STARTED\n';

    /// per its documentation, `writeAsString` “Opens the file, writes
    /// the string in the given encoding, and closes the file”
    return _logFile.writeAsString(text, mode: FileMode.write, flush: true);
  }

  static Future log(String s) async {
    final text = '${DateTime.now()}: $s\n';
    /*return _lock.synchronized(() async {
      await _logFile.writeAsString(text, mode: FileMode.append, flush: true);
    });*/
    await _logFile.writeAsString(text, mode: FileMode.append, flush: true);
  }

  static File _createLogFile(pathFile) => File(pathFile);

  static Future<int> readCounter() async {
    try {
      // Read the file
      final contents = await _logFile.readAsString();

      return int.parse(contents);
    } catch (e) {
      // If encountering an error, return 0
      return 0;
    }
  }
}
