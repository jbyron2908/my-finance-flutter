import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/ui/app/app_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/account_viewer/controller/account_viewer_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/account_viewer/widget/account_viewer_view.dart';

class AccountViewerScreen extends StatelessWidget {
  static String get _routePath => '/home/account_viewer';
  static GetPageRoute get route => GetPageRoute(
        settings: RouteSettings(
          name: _routePath,
        ),
        page: () => AccountViewerScreen(),
        binding: AccountViewerBinding(),
      );

  static void navigateTo(AccountViewerArg argument) {
    AppRouter.navigateTo(_routePath, argument);
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
