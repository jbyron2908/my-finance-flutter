import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/result/screen/import_csv_result_screen.dart';

class ImportCsvResultRoute extends BaseRoute<ImportCsvResultScreenArgs> {
  ImportCsvResultRoute({ImportCsvResultScreenArgs arguments})
      : super(argument: arguments);

  @override
  String get routePath => "/importCsv/result";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => ImportCsvResultScreen(),
      settings: routeSettings,
    );
  }
}
