import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/base_router.dart';
import 'package:my_finance_flutter/ui/view/import_csv/result/screen/import_result_screen.dart';

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