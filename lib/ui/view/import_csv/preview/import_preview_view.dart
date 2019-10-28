import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/model/account_model.dart';
import 'package:my_finance_flutter/ui/view/import_csv/preview/operation_preview_model.dart';

class ImportCsvPreviewView extends StatefulWidget {
  ImportCsvPreviewView({Key key, this.csvFile, this.account}) : super(key: key);

  static MaterialPageRoute getRoute(RouteSettings routeSettings) {
    var arguments = routeSettings.arguments as Map;
    File file = arguments['file'];
    AccountModel account = arguments['account'];

    return MaterialPageRoute(
      builder: (context) => ImportCsvPreviewView(
        account: account,
        csvFile: file,
      ),
      settings: routeSettings,
    );
  }

  final File csvFile;
  final AccountModel account;

  @override
  _ImportCsvPreviewViewState createState() => _ImportCsvPreviewViewState();
}

class _ImportCsvPreviewViewState extends State<ImportCsvPreviewView> {
  OperationPreviewModel operationPreview;
  bool loading = true;

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
    var csvFields = await widget.csvFile
        .openRead()
        .transform(utf8.decoder)
        .transform(CsvToListConverter(fieldDelimiter: ",", eol: "\n"))
        .toList();

    List<dynamic> firstRow = csvFields.first;

    var preview = OperationPreviewModel(
      date: firstRow[dateColumn],
      value: firstRow[valueColumn],
      title: firstRow[titleColumn],
      payee: firstRow[payeeColumn],
      parentCategory: firstRow[parentCategoryColumn],
      subCategory: firstRow[subCategoryColumn],
    );

    setState(() {
      loading = false;
      operationPreview = preview;
    });
  }

  void _submit() {}
}
