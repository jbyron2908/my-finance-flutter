import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/preview/screen/import_csv_preview_screen.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:provider/provider.dart';

class ImportCsvPreviewRoute extends BaseRoute<ImportCsvPreviewRouteArgs, void>
    with MainTabRoute {
  ImportCsvPreviewRoute.forRouter();

  ImportCsvPreviewRoute({ImportCsvPreviewRouteArgs arguments})
      : super(argument: arguments);

  @override
  String get routePath => '/importCsv/preview';

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => ImportCsvPreviewScreen(),
      settings: routeSettings,
    );
  }
}

class ImportCsvPreviewRouteArgs {
  static ImportCsvPreviewRouteArgs of(BuildContext context) =>
      Provider.of<ImportCsvPreviewRouteArgs>(context, listen: false);

  final File csvFile;
  final AccountModel account;

  ImportCsvPreviewRouteArgs({
    this.csvFile,
    this.account,
  });
}
