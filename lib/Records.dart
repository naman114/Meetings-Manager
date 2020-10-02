import 'package:flutter/foundation.dart';
import 'Dart:io';
import 'package:path_provider/path_provider.dart';

class Records {

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File("$path/meetingRecords.txt");
  }

  dynamic readRecords() async {
    try{
      final file = await _localFile;
      var contents = await file.readAsLines();
      return contents;
    } catch(e) {
      return null;
    }
  }

  List<List<String>> formattedReadRecords (List<String> readRecords){
    List<String> _names, _urls;
    List<List<String>> _formattedRecords = [_names, _urls];
    for (int i=0; i < readRecords.length;){
      _formattedRecords[0].add(readRecords[i]);
      i++;
      _formattedRecords[1].add(readRecords[i]);
      i++;
    }
    return _formattedRecords;
  }

  Future<File> writeRecords(String data) async {
    final file = await _localFile;
    return file.writeAsString("$data", mode: FileMode.append);
  }

  String formatOutRecord (List<String> recordData) => recordData.join('\n');
}

