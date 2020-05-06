import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/app/router/app_router.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/splash/screen/splash_screen.dart';

class SplashRoute extends BaseRoute<SplashScreenArgs> with AppRoute {
  SplashRoute.forRouter();

  SplashRoute({SplashScreenArgs argument}) : super(argument: argument);

  @override
  String get routePath => '/';

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => SplashScreen(),
      settings: routeSettings,
    );
  }
}
