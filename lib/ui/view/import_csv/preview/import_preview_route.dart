import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/model/account_model.dart';
import 'package:my_finance_flutter/ui/common/base/base_router.dart';
import 'package:my_finance_flutter/ui/view/import_csv/preview/import_preview_view.dart';

class ImportCsvPreviewRoute extends BaseRoute {
  ImportCsvPreviewRouteArgs routeArguments;

  ImportCsvPreviewRoute({this.routeArguments});

  @override
  String get routePath => "/importCsv/preview";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    var arguments = routeSettings.arguments as ImportCsvPreviewRouteArgs;

    return MaterialPageRoute(
      builder: (context) => ImportCsvPreviewView(
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
