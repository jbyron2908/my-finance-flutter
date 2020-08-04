import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/app/app_router.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/form/controller/import_csv_form_controller.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/form/widget/import_csv_form_view.dart';

class ImportCsvFormScreen extends StatelessWidget {
  static String get _routePath => '/importCsv/form';
  static GetPageRoute get route => GetPageRoute(
        settings: RouteSettings(
          name: _routePath,
        ),
        page: () => ImportCsvFormScreen(),
        binding: ImportCsvFormBinding(),
      );

  static void navigateTo() {
    AppRouter.navigateTo(_routePath);
  }

  @override
  Widget build(BuildContext context) {
    return ImportCsvFormView();
  }
}

class ImportCsvFormBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ImportCsvFormController());
  }
}
