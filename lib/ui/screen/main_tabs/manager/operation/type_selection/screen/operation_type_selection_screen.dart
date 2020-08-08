import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/operation/operation_model.dart';
import 'package:my_finance_flutter/ui/common/navigation/navigation_handler.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/type_selection/controller/operation_type_selection_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/type_selection/widget/operation_type_selection_view.dart';

class OperationTypeSelectionScreen extends StatelessWidget {
  static String get _routeName => '/manager/operation/type_selection';
  static RouteDefinition get routeDefinition => RouteDefinition(
        name: _routeName,
        routeBuilder: (routeSetting) => GetPageRoute<OperationTypeModel>(
          settings: routeSetting,
          page: () => OperationTypeSelectionScreen(),
          binding: OperationTypeSelectionBinding(),
        ),
      );

  static Future<OperationTypeModel> navigateTo() {
    return MainTabRouter.navigateTo(_routeName);
  }

  @override
  Widget build(BuildContext context) {
    return OperationTypeSelectionView();
  }
}

class OperationTypeSelectionBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(OperationTypeSelectionController());
  }
}
