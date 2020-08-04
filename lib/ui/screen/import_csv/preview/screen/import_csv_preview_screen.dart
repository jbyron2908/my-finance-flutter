import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/ui/app/app_router.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/preview/controller/import_csv_preview_controller.dart';
import 'package:my_finance_flutter/ui/screen/import_csv/preview/widget/import_csv_preview_view.dart';

class ImportCsvPreviewScreen extends StatelessWidget {
  static String get _routePath => '/importCsv/preview';
  static GetPageRoute get route => GetPageRoute(
        settings: RouteSettings(
          name: _routePath,
        ),
        page: () => ImportCsvPreviewScreen(),
        binding: ImportCsvPreviewBinding(),
      );

  static void navigateTo(ImportCsvPreviewArg argument) {
    AppRouter.navigateTo(_routePath, argument);
  }

  @override
  Widget build(BuildContext context) {
    return ImportCsvPreviewView();
  }
}

class ImportCsvPreviewBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ImportCsvPreviewController());
  }
}

class ImportCsvPreviewArg {
  final File csvFile;
  final AccountModel account;

  ImportCsvPreviewArg({
    this.csvFile,
    this.account,
  });
}
