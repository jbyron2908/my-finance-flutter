import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/ui/common/navigation/navigation_handler.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/account_viewer/controller/account_viewer_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/account_viewer/widget/account_viewer_view.dart';

class AccountViewerScreen extends StatelessWidget {
  static String get _routeName => '/home/account_viewer';
  static RouteDefinition get routeDefinition => RouteDefinition(
        name: _routeName,
        routeBuilder: (routeSetting) => GetPageRoute(
          settings: routeSetting,
          page: () => AccountViewerScreen(),
          binding: AccountViewerBinding(),
        ),
      );

  static void navigateTo(AccountViewerArg argument) {
    MainTabRouter.navigateTo(_routeName, argument);
  }

  @override
  Widget build(BuildContext context) {
    return AccountViewerView();
  }
}

class AccountViewerBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AccountViewerController());
  }
}

class AccountViewerArg {
  final AccountModel account;

  AccountViewerArg(
    this.account,
  );
}
