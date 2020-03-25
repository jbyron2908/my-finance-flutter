import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/account/index.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/preview/screen/import_csv_preview_screen.dart';

class ImportCsvPreviewRoute extends BaseRoute {
  ImportCsvPreviewRouteArgs routeArguments;

  ImportCsvPreviewRoute({this.routeArguments});

  @override
  String get routePath => "/importCsv/preview";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    var arguments = routeSettings.arguments as ImportCsvPreviewRouteArgs;

    return MaterialPageRoute(
      builder: (context) => ImportCsvPreviewScreen(
        account: arguments.account,
        csvFile: arguments.file,
      ),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => this.routeArguments;
}

class ImportCsvPreviewRouteArgs {
  ImportCsvPreviewRouteArgs({
    this.account,
    this.file,
  });

  AccountModel account;
  File file;
}
