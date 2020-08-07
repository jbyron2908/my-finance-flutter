import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/list/controller/account_list_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/list/widget/account_list_view.dart';

class AccountListScreen extends StatelessWidget {
  static String get _routePath => '/manager/account/list';
  static GetPageRoute get route => GetPageRoute(
        settings: RouteSettings(
          name: _routePath,
        ),
        page: () => AccountListScreen(),
        binding: AccountListBinding(),
      );

  static void navigateTo() {
    MainTabRouter.navigateTo(_routePath);
  }

  @override
  Widget build(BuildContext context) {
    return AccountListView();
  }
}

class AccountListBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AccountListController());
  }
}
