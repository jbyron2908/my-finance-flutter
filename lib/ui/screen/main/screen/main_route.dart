import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/app/router/app_router.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main/screen/main_screen.dart';
import 'package:provider/provider.dart';

class MainRoute extends BaseRoute<MainRouteArgs, void> with AppRoute {
  MainRoute.forRouter();

  MainRoute({MainRouteArgs arguments}) : super(argument: arguments);

  @override
  String get routePath => '/main';

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => MainScreen(),
      settings: routeSettings,
    );
  }
}

class MainRouteArgs {
  static MainRouteArgs of(BuildContext context) =>
      Provider.of<MainRouteArgs>(context, listen: false);

  int field1;

  MainRouteArgs({
    this.field1,
  });
}
