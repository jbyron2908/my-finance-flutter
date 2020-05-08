import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/form/screen/import_csv_form_screen.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';

class ImportCsvFormRoute extends BaseRoute<ImportCsvFormScreenArgs>
    with MainTabRoute {
  ImportCsvFormRoute.forRouter();

  ImportCsvFormRoute({ImportCsvFormScreenArgs argument})
      : super(argument: argument);

  @override
  String get routePath => '/importCsv/form';

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => ImportCsvFormScreen(),
      settings: routeSettings,
    );
  }
}
