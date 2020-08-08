import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/common/navigation/navigation_handler.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/form/controller/label_form_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/form/widget/label_form_view.dart';

class LabelFormScreen extends StatelessWidget {
  static String get _routeName => '/manager/label/form';
  static RouteDefinition get routeDefinition => RouteDefinition(
        name: _routeName,
        routeBuilder: (routeSetting) => GetPageRoute(
          settings: routeSetting,
          page: () => LabelFormScreen(),
          binding: LabelFormBinding(),
        ),
      );

  static void navigateTo() {
    MainTabRouter.navigateTo(_routeName);
  }

  @override
  Widget build(BuildContext context) {
    return LabelFormView();
  }
}

class LabelFormBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LabelFormController());
  }
}
