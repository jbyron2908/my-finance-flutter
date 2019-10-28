import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/view/import_csv/form/import_form.dart';
import 'package:my_finance_flutter/ui/view/import_csv/preview/import_preview_route.dart';

class ImportCsvFormView extends StatelessWidget {
  const ImportCsvFormView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Import Csv File"),
      ),
      body: ImportCsvForm(
        onSubmit: (account, csvFile) =>
            ImportCsvPreviewRoute.navigateTo(context, account, csvFile),
      ),
    );
  }
}
