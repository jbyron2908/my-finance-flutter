import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/app/router/app_router.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main/screen/main_screen.dart';

class MainRoute extends BaseRoute<MainScreenArgs> with AppRoute {
  MainRoute.forRouter();

  MainRoute({MainScreenArgs arguments}) : super(argument: arguments);

  @override
  String get routePath => "/main";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => MainScreen(),
      settings: routeSettings,
    );
  }
}
