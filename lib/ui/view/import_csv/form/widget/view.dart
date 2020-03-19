import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/app/router/app_router.dart';
import 'package:my_finance_flutter/ui/view/import_csv/form/widget/form.dart';
import 'package:my_finance_flutter/ui/view/import_csv/preview/screen/route.dart';

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
