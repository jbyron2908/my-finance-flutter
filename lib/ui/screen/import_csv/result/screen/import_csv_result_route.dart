import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/result/screen/import_csv_result_screen.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';

class ImportCsvResultRoute extends BaseRoute<ImportCsvResultScreenArgs>
    with MainTabRoute {
  ImportCsvResultRoute.forRouter();

  ImportCsvResultRoute({ImportCsvResultScreenArgs arguments})
      : super(argument: arguments);

  @override
  String get routePath => '/importCsv/result';

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => ImportCsvResultScreen(),
      settings: routeSettings,
    );
  }
}
