import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/app/app_router.dart';
import 'package:my_finance_flutter/ui/view/import_csv/form/widget/import_form.dart';
import 'package:my_finance_flutter/ui/view/import_csv/preview/import_preview_route.dart';

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
