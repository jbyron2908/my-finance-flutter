import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/playground/screen/playground_screen.dart';
import 'package:provider/provider.dart';

class PlaygroundRoute extends BaseRoute<PlaygroundRouteArgs, void>
    with MainTabRoute {
  PlaygroundRoute.forRouter();

  PlaygroundRoute({PlaygroundRouteArgs argument}) : super(argument: argument);

  @override
  String get routePath => '/routeName';

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => PlaygroundScreen(),
      settings: routeSettings,
    );
  }
}

class PlaygroundRouteArgs {
  static PlaygroundRouteArgs of(BuildContext context) =>
      Provider.of<PlaygroundRouteArgs>(context, listen: false);

  int field1;

  PlaygroundRouteArgs({
    this.field1,
  });
}
