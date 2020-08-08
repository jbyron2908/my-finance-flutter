import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/common/navigation/navigation_handler.dart';
import 'package:my_finance_flutter/ui/screen/splash/controller/splash_controller.dart';
import 'package:my_finance_flutter/ui/screen/splash/widget/splash_view.dart';

class SplashScreen extends StatelessWidget {
  static String get _routeName => '/';
  static RouteDefinition get routeDefinition => RouteDefinition(
        name: _routeName,
        routeBuilder: (routeSetting) => GetPageRoute(
          settings: routeSetting,
          page: () => SplashScreen(),
          binding: SplashBinding(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SplashView(),
    );
  }
}

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
