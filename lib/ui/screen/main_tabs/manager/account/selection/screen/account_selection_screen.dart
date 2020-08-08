import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/account/account_model.dart';
import 'package:my_finance_flutter/ui/common/navigation/navigation_handler.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/selection/controller/account_selection_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/selection/widgets/account_selection_view.dart';

class AccountSelectionScreen extends StatelessWidget {
  static String get _routeName => '/manager/account/selection';
  static RouteDefinition get routeDefinition => RouteDefinition(
        name: _routeName,
        routeBuilder: (routeSetting) => GetPageRoute<AccountModel>(
          settings: routeSetting,
          page: () => AccountSelectionScreen(),
          binding: AccountSelectionBinding(),
        ),
      );

  static Future<AccountModel> navigateTo() {
    return MainTabRouter.navigateTo(_routeName);
  }

  @override
  Widget build(BuildContext context) {
    return AccountSelectionView();
  }
}

class AccountSelectionBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AccountSelectionController());
  }
}
