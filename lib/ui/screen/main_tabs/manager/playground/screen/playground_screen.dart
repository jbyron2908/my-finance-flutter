import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/app/app_router.dart';
import 'package:my_finance_flutter/ui/common/navigation/navigation_handler.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/playground/controller/playground_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/playground/widget/playground_view.dart';

class PlaygroundScreen extends StatelessWidget {
  static String get _routeName => '/playground';
  static RouteDefinition get routeDefinition => RouteDefinition(
        name: _routeName,
        routeBuilder: (routeSetting) => GetPageRoute(
          settings: routeSetting,
          page: () => PlaygroundScreen(),
          binding: PlaygroundBinding(),
        ),
      );

  static void navigateTo() {
    AppRouter.navigateTo(_routeName);
  }

  @override
  Widget build(BuildContext context) {
    return PlaygroundView();
  }
}

class PlaygroundBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PlaygroundController());
  }
}
