import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/screen/splash/controller/splash_controller.dart';
import 'package:my_finance_flutter/ui/screen/splash/widget/splash_view.dart';

class SplashScreen extends StatelessWidget {
  static String get _routePath => '/';
  static GetPageRoute get route => GetPageRoute(
        settings: RouteSettings(
          name: _routePath,
        ),
        page: () => SplashScreen(),
        binding: SplashBinding(),
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
