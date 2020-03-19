import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/router.dart';
import 'package:my_finance_flutter/ui/screen/splash/screen/screen.dart';

class SplashRoute extends BaseRoute {
  @override
  String get routePath => "/";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => SplashScreen(),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}
