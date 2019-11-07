import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/base_router.dart';
import 'package:my_finance_flutter/ui/view/import_csv/result/import_result_view.dart';

class ImportCsvResultRoute extends BaseRoute {
  @override
  String get routePath => "/importCsv/result";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => ImportCsvResultView(),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}
