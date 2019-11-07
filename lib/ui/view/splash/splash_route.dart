import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/base_router.dart';
import 'package:my_finance_flutter/ui/view/splash/splash_view.dart';

class SplashRoute extends BaseRoute {
  @override
  String get routePath => "/";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => SplashView(),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}
