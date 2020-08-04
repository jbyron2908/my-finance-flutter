import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/app/app_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/list/controller/operation_list_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/list/widget/operation_list_view.dart';

class OperationListScreen extends StatelessWidget {
  static String get _routePath => '/manager/operation/list';
  static GetPageRoute get route => GetPageRoute(
        settings: RouteSettings(
          name: _routePath,
        ),
        page: () => OperationListScreen(),
        binding: OperationListBinding(),
      );

  static void navigateTo() {
    AppRouter.navigateTo(_routePath);
  }

  @override
  Widget build(BuildContext context) {
    return OperationListView();
  }
}

class OperationListBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(OperationListController());
  }
}
