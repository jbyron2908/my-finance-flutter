import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/ui/common/navigation/navigation_handler.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/form/controller/account_form_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/form/controller/account_form_view_model.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/form/widget/account_form_view.dart';

class AccountFormScreen extends StatelessWidget {
  static String get _routeName => '/manager/account/form';
  static RouteDefinition get routeDefinition => RouteDefinition(
        name: _routeName,
        routeBuilder: (routeSetting) => GetPageRoute(
          settings: routeSetting,
          page: () => AccountFormScreen(),
          binding: AccountFormBinding(),
        ),
      );

  static void navigateTo(AccountFormArg argument) {
    MainTabRouter.navigateTo(_routeName, argument);
  }

  @override
  Widget build(BuildContext context) {
    return AccountFormView();
  }
}

class AccountFormBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AccountFormViewModel());
    Get.put(AccountFormController());
  }
}

class AccountFormArg {
  final AccountModel account;

  AccountFormArg(
    this.account,
  );

  static AccountFormArg create() {
    var account = AccountModel();

    return AccountFormArg(account);
  }

  static AccountFormArg edit(AccountModel account) {
    return AccountFormArg(account);
  }
}
