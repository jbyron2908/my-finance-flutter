import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/view/import_csv/result/import_result_view.dart';

class ImportCsvResultRoute {
  static MapEntry get route => MapEntry(_routePath, generateRoute);

  static String _routePath = "/importCsv/result";

  static MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => ImportCsvResultView(),
      settings: routeSettings,
    );
  }

  static void navigateTo(BuildContext context) {
    Navigator.pushNamed(context, _routePath);
  }
}
