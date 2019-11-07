import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/base_router.dart';
import 'package:my_finance_flutter/ui/view/import_csv/form/import_form_view.dart';

class ImportCsvFormRoute extends BaseRoute {
  @override
  String get routePath => "/importCsv/form";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => ImportCsvFormView(),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}
