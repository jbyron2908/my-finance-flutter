import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/app/router/app_router.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/form/widget/import_csv_form.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/preview/screen/import_csv_preview_route.dart';

class ImportCsvFormView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Import Csv File"),
      ),
      body: ImportCsvForm(
        onSubmit: (account, csvFile) => AppRouter.navigateTo(
          context,
          ImportCsvPreviewRoute(
            routeArguments: ImportCsvPreviewRouteArgs(
              account: account,
              file: csvFile,
            ),
          ),
        ),
      ),
    );
  }
}
