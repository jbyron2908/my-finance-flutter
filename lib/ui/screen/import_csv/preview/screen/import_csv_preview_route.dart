import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/preview/screen/import_csv_preview_screen.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';

class ImportCsvPreviewRoute extends BaseRoute<ImportCsvPreviewScreenArgs>
    with MainTabRoute {
  ImportCsvPreviewRoute.forRouter();

  ImportCsvPreviewRoute({ImportCsvPreviewScreenArgs arguments})
      : super(argument: arguments);

  @override
  String get routePath => '/importCsv/preview';

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => ImportCsvPreviewScreen(),
      settings: routeSettings,
    );
  }
}
