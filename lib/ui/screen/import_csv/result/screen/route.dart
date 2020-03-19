import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/router.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/result/screen/screen.dart';

class ImportCsvResultRoute extends BaseRoute {
  @override
  String get routePath => "/importCsv/result";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => ImportCsvResultScreen(),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}
