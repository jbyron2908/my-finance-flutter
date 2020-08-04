import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/app/app_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/list/controller/payee_list_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/list/widget/payee_list_view.dart';

class PayeeListScreen extends StatelessWidget {
  static String get _routePath => '/manager/payee/list';
  static GetPageRoute get route => GetPageRoute(
        settings: RouteSettings(
          name: _routePath,
        ),
        page: () => PayeeListScreen(),
        binding: PayeeListBinding(),
      );

  static void navigateTo() {
    AppRouter.navigateTo(_routePath);
  }

  @override
  Widget build(BuildContext context) {
    return PayeeListView();
  }
}

class PayeeListBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PayeeListController());
  }
}
