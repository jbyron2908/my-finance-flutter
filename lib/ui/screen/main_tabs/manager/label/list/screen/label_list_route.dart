import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/list/screen/label_list_screen.dart';

class LabelListRoute extends BaseRoute {
  @override
  String get routePath => "/manager/label/list";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    var arguments = routeSettings.arguments as LabelListRouteArgs;

    return MaterialPageRoute(
      builder: (context) => LabelListScreen(arguments),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}

class LabelListRouteArgs {
  int field1;

  LabelListRouteArgs({
    this.field1,
  });
}
