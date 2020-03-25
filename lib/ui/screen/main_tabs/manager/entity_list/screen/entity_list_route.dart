import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/entity_list/screen/entity_list_screen.dart';

class EntityListRoute extends BaseRoute {
  @override
  String get routePath => "/manager/tab";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    var arguments = routeSettings.arguments as EntityListRouteArgs;

    return MaterialPageRoute(
      builder: (context) => EntityListScreen(arguments),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}

class EntityListRouteArgs {
  int field1;

  EntityListRouteArgs({
    this.field1,
  });
}
