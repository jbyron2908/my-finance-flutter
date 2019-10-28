import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/model/account_model.dart';
import 'package:my_finance_flutter/ui/view/import_csv/preview/import_preview_view.dart';

class ImportCsvPreviewRoute {
  static MapEntry get route => MapEntry(_routePath, _generateRoute);

  static String _routePath = "/importCsv/preview";

  static String _accountArgument = 'account';
  static String _fileArgument = 'file';

  static MaterialPageRoute _generateRoute(RouteSettings routeSettings) {
    var arguments = routeSettings.arguments as Map;

    AccountModel account = arguments[_accountArgument];
    File file = arguments[_fileArgument];

    return MaterialPageRoute(
      builder: (context) => ImportCsvPreviewView(
        account: account,
        csvFile: file,
      ),
      settings: routeSettings,
    );
  }

  static void navigateTo(
      BuildContext context, AccountModel account, File file) {
    Navigator.pushNamed(
      context,
      _routePath,
      arguments: {
        _accountArgument: account,
        _fileArgument: file,
      },
    );
  }
}
