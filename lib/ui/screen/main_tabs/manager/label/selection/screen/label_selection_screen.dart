import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/label/label_model.dart';
import 'package:my_finance_flutter/ui/common/navigation/navigation_handler.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/selection/controller/label_selection_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/selection/widget/label_selection_view.dart';

class LabelSelectionScreen extends StatelessWidget {
  static String get _routeName => '/manager/label/selection';
  static RouteDefinition get routeDefinition => RouteDefinition(
        name: _routeName,
        routeBuilder: (routeSetting) => GetPageRoute<List<LabelModel>>(
          settings: routeSetting,
          page: () => LabelSelectionScreen(),
          binding: LabelSelectionBinding(),
        ),
      );

  static Future<List<LabelModel>> navigateTo() {
    return MainTabRouter.navigateTo(_routeName);
  }

  @override
  Widget build(BuildContext context) {
    return LabelSelectionView();
  }
}

class LabelSelectionBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LabelSelectionController());
  }
}

class LabelSelectionArg {
  bool selectParent;

  LabelSelectionArg([this.selectParent = false]);
}
