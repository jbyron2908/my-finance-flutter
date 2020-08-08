import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/operation/operation_model.dart';
import 'package:my_finance_flutter/ui/common/navigation/navigation_handler.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/state_selection/controller/operation_state_selection_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/state_selection/widget/operation_state_selection_view.dart';

class OperationStateSelectionScreen extends StatelessWidget {
  static String get _routeName => '/manager/operation/state_selection';
  static RouteDefinition get routeDefinition => RouteDefinition(
        name: _routeName,
        routeBuilder: (routeSetting) => GetPageRoute<OperationStateModel>(
          settings: routeSetting,
          page: () => OperationStateSelectionScreen(),
          binding: OperationStateSelectionBinding(),
        ),
      );

  static Future<OperationStateModel> navigateTo() {
    return MainTabRouter.navigateTo(_routeName);
  }

  @override
  Widget build(BuildContext context) {
    return OperationStateSelectionView();
  }
}

class OperationStateSelectionBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(OperationStateSelectionController());
  }
}
