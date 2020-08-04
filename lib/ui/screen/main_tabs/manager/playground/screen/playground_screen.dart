import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/app/app_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/playground/controller/playground_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/playground/widget/playground_view.dart';

class PlaygroundScreen extends StatelessWidget {
  static String get _routePath => '/playground';
  static GetPageRoute get route => GetPageRoute(
        settings: RouteSettings(
          name: _routePath,
        ),
        page: () => PlaygroundScreen(),
        binding: PlaygroundBinding(),
      );

  static void navigateTo() {
    AppRouter.navigateTo(_routePath);
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
