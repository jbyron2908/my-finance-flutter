import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/app/router/app_router.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/splash/screen/splash_screen.dart';
import 'package:provider/provider.dart';

class SplashRoute extends BaseRoute<SplashRouteArgs, void> with AppRoute {
  SplashRoute.forRouter();

  SplashRoute({SplashRouteArgs argument}) : super(argument: argument);

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

class SplashRouteArgs {
  static SplashRouteArgs of(BuildContext context) =>
      Provider.of<SplashRouteArgs>(context, listen: false);

  int field1;

  SplashRouteArgs({
    this.field1,
  });
}
