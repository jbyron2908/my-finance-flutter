import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/app/app_router.dart';
import 'package:my_finance_flutter/ui/view/import_csv/form/import_form.dart';

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
            AppRouter.navigateToImportCsvPreview(context, account, csvFile),
      ),
    );
  }
}
