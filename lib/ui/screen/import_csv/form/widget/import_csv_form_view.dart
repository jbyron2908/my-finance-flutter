import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/form/widget/import_csv_form.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/preview/screen/import_csv_preview_route.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/preview/screen/import_csv_preview_screen.dart';

class ImportCsvFormView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Import Csv File'),
      ),
      body: ImportCsvForm(
        onSubmit: (account, csvFile) => ImportCsvPreviewRoute(
          arguments: ImportCsvPreviewScreenArgs(
            account: account,
            csvFile: csvFile,
          ),
        ).navigateIntoTab(context),
      ),
    );
  }
}
