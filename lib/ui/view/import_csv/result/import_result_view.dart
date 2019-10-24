import 'package:flutter/material.dart';

class ImportCsvResultView extends StatefulWidget {
  ImportCsvResultView({Key key}) : super(key: key);

  @override
  _ImportCsvResultViewState createState() => _ImportCsvResultViewState();
}

class _ImportCsvResultViewState extends State<ImportCsvResultView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Import CSV"),
      ),
      body: Center(
        child: Text("Done"),
      ),
    );
  }
}
