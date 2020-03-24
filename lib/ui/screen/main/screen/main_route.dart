import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_router.dart';
import 'package:my_finance_flutter/ui/screen/main/screen/main_screen.dart';

class MainRoute extends BaseRoute {
  MainRouteArgs routeArguments;

  MainRoute({this.routeArguments});

  @override
  String get routePath => "/main";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    var arguments = routeSettings.arguments as MainRouteArgs;

    return MaterialPageRoute(
      builder: (context) => MainScreen(arguments),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => this.routeArguments;
}

class MainRouteArgs {
  int field1;

  MainRouteArgs({
    this.field1,
  });
}
