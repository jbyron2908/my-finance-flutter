import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';
import 'package:my_finance_flutter/ui/common/navigation/navigation_handler.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/selection/controller/payee_selection_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/selection/widget/payee_selection_view.dart';

class PayeeSelectionScreen extends StatelessWidget {
  static String get _routeName => '/manager/payee/selection';
  static RouteDefinition get routeDefinition => RouteDefinition(
        name: _routeName,
        routeBuilder: (routeSetting) => GetPageRoute<PayeeModel>(
          settings: routeSetting,
          page: () => PayeeSelectionScreen(),
          binding: PayeeSelectionBinding(),
        ),
      );

  static Future<PayeeModel> navigateTo() {
    return MainTabRouter.navigateTo(_routeName);
  }

  @override
  Widget build(BuildContext context) {
    return PayeeSelectionView();
  }
}

class PayeeSelectionBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PayeeSelectionController());
  }
}
