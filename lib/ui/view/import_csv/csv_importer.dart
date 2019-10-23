import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';

class CsvImporter {
  File csvFile;
  List<List<dynamic>> csvFields;

  final dateColumn = 0;
  final payeeColumn = 1;
  final valueColumn = 2;
  final parentCategoryColumn = 3;
  final subCategoryColumn = 4;
  final titleColumn = 6;

  Future setCsvFile(File file) async {
    final input = file.openRead();
    csvFields = await input
        .transform(utf8.decoder)
        .transform(CsvToListConverter(fieldDelimiter: ",", eol: "\n"))
        .toList();
  }

  OperationPreviewModel getPreview() {
    List<dynamic> firstRow = csvFields.first;

    return OperationPreviewModel(
      date: firstRow[dateColumn],
      value: firstRow[valueColumn],
      title: firstRow[titleColumn],
      payee: firstRow[payeeColumn],
      parentCategory: firstRow[parentCategoryColumn],
      subCategory: firstRow[subCategoryColumn],
    );
  }
}

class OperationPreviewModel {
  String date;
  String payee;
  String value;
  String parentCategory;
  String subCategory;
  String title;

  OperationPreviewModel({
    this.date,
    this.payee,
    this.value,
    this.parentCategory,
    this.subCategory,
    this.title,
  });
}
