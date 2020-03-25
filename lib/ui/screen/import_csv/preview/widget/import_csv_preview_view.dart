import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/config/log/logger.dart';
import 'package:my_finance_flutter/core/model/account/index.dart';
import 'package:my_finance_flutter/core/model/payee/index.dart';
import 'package:my_finance_flutter/core/provider/repository/payee/payee_repository.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/preview/bloc/import_csv_preview_model.dart';

class ImportCsvPreviewView extends StatefulWidget {
  ImportCsvPreviewView({Key key, this.csvFile, this.account}) : super(key: key);

  final File csvFile;
  final AccountModel account;

  @override
  _ImportCsvPreviewViewState createState() => _ImportCsvPreviewViewState();
}

class _ImportCsvPreviewViewState extends State<ImportCsvPreviewView> {
  OperationPreviewModel operationPreview;
  bool loading = true;
  List<List<dynamic>> csvFields;

  @override
  void initState() {
    super.initState();
    getPreview();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Import CSV"),
      ),
      body: Center(
        child: loading
            ? Column(
                children: <Widget>[
                  CircularProgressIndicator(),
                  Text("Loading"),
                ],
              )
            : Column(
                children: <Widget>[
                  _buildFileContainer(),
                  RaisedButton(
                    child: Text("Submit"),
                    onPressed: _submit,
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildFileContainer() {
    return ListView(
      shrinkWrap: true,
      children: [
        Text("Title : ${operationPreview.title}"),
        Text("Date : ${operationPreview.date}"),
        Text("Value : ${operationPreview.value}"),
        Text("Payee : ${operationPreview.payee}"),
        Text("Category : ${operationPreview.parentCategory}"),
        Text("Subcategory : ${operationPreview.subCategory}"),
      ],
    );
  }

  final dateColumn = 0;
  final payeeColumn = 1;
  final valueColumn = 2;
  final parentCategoryColumn = 3;
  final subCategoryColumn = 4;
  final titleColumn = 6;

  void getPreview() async {
    csvFields = await widget.csvFile
        .openRead()
        .transform(utf8.decoder)
        .transform(CsvToListConverter(fieldDelimiter: ",", eol: "\n"))
        .toList();

    List<dynamic> firstRow = csvFields.first;

    OperationPreviewModel preview = createPreview(firstRow);

    setState(() {
      loading = false;
      operationPreview = preview;
    });
  }

  OperationPreviewModel createPreview(List row) {
    var preview = OperationPreviewModel(
      date: row[dateColumn],
      value: row[valueColumn],
      title: row[titleColumn],
      payee: row[payeeColumn],
      parentCategory: row[parentCategoryColumn],
      subCategory: row[subCategoryColumn],
    );
    return preview;
  }

  void _submit() async {
    var payeeRepository = PayeeRepository.of(context);

    for (var row in csvFields) {
      var preview = createPreview(row);
      PayeeModel payee = await payeeRepository.getOrAdd(preview.payee);
      Log.i(payee.toJson());
    }
  }
}
