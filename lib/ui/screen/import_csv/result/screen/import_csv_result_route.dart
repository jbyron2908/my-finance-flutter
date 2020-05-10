import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/result/screen/import_csv_result_screen.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:provider/provider.dart';

class ImportCsvResultRoute extends BaseRoute<ImportCsvResultRouteArgs, void>
    with MainTabRoute {
  ImportCsvResultRoute.forRouter();

  ImportCsvResultRoute({ImportCsvResultRouteArgs arguments})
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

class ImportCsvResultRouteArgs {
  static ImportCsvResultRouteArgs of(BuildContext context) =>
      Provider.of<ImportCsvResultRouteArgs>(context, listen: false);

  int field1;

  ImportCsvResultRouteArgs({
    this.field1,
  });
}
