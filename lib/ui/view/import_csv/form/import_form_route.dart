import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/view/import_csv/form/import_form_view.dart';

class ImportCsvFormRoute {
  static MapEntry get route => MapEntry(_routePath, _generateRoute);

  static String _routePath = "/importCsv/form";

  static MaterialPageRoute _generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => ImportCsvFormView(),
      settings: routeSettings,
    );
  }

  static void navigateTo(BuildContext context) {
    Navigator.pushNamed(
      context,
      _routePath,
    );
  }
}
