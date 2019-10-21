import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/config/log/logger.dart';

class ImportCsvView extends StatefulWidget {
  ImportCsvView({Key key}) : super(key: key);

  @override
  _ImportCsvViewState createState() => _ImportCsvViewState();
}

class _ImportCsvViewState extends State<ImportCsvView> {
  File file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Import CSV"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("Pick file"),
              onPressed: _openFilePicker,
            ),
            ..._buildFileContainer(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildFileContainer() {
    if (file != null) {
      return [
        Text("File: ${file.path}"),
        RaisedButton(
          child: Text("Parse file"),
          onPressed: _convertFile,
        ),
      ];
    } else {
      return List();
    }
  }

  void _openFilePicker() async {
    final result = await FilePicker.getFile(fileExtension: "csv");
    setState(() {
      file = result;
      Log.i(file.path);
    });
  }

  void _convertFile() async {
    final input = file.openRead();
    List<List<dynamic>> fields = await input
        .transform(utf8.decoder)
        .transform(CsvToListConverter(fieldDelimiter: ",", eol: "\n"))
        .toList();
    Log.i(fields);
  }
}
