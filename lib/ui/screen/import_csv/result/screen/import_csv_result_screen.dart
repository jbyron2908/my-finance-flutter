import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/app/app_router.dart';
import 'package:my_finance_flutter/ui/common/navigation/navigation_handler.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/result/controller/import_csv_result_controller.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/result/widget/import_csv_result_view.dart';

class ImportCsvResultScreen extends StatelessWidget {
  static String get _routeName => '/importCsv/result';
  static RouteDefinition get routeDefinition => RouteDefinition(
        name: _routeName,
        routeBuilder: (routeSetting) => GetPageRoute(
          settings: routeSetting,
          page: () => ImportCsvResultScreen(),
          binding: ImportCsvResultBinding(),
        ),
      );

  static void navigateTo() {
    AppRouter.navigateTo(_routeName);
  }

  @override
  Widget build(BuildContext context) {
    return ImportCsvResultView();
  }
}

class ImportCsvResultBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ImportCsvResultController());
  }
}
