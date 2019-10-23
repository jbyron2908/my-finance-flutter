import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/view/import_csv/csv_importer.dart';

class ImportCsvPreviewView extends StatefulWidget {
  ImportCsvPreviewView({Key key}) : super(key: key);

  @override
  _ImportCsvPreviewViewState createState() => _ImportCsvPreviewViewState();
}

class _ImportCsvPreviewViewState extends State<ImportCsvPreviewView> {
  CsvImporter csvImporter = CsvImporter();
  bool hasFile = false;

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
    if (hasFile == true) {
      final csvFile = csvImporter.csvFile;
      final operationPreview = csvImporter.getPreview();

      return [
        Text("File: ${csvFile.path}"),
        ListView(
          children: [
            Text("Title : ${operationPreview.title}"),
            Text("Date : ${operationPreview.date}"),
            Text("Value : ${operationPreview.value}"),
            Text("Payee : ${operationPreview.payee}"),
            Text("Category : ${operationPreview.parentCategory}"),
            Text("Subcategory : ${operationPreview.subCategory}"),
          ],
        ),
      ];
    } else {
      return List();
    }
  }

  void _openFilePicker() async {
    final file = await FilePicker.getFile(fileExtension: "csv");
    _setResultFile(file);
  }

  void _setResultFile(File file) {
    if (file != null) {
      setState(() {
        csvImporter.setCsvFile(file);
        hasFile = true;
      });
    } else {
      setState(() {
        csvImporter.setCsvFile(null);
        hasFile = false;
      });
    }
  }
}
