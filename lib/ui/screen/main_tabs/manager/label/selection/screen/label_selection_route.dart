import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/label/index.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/selection/screen/label_selection_screen.dart';

class LabelSelectionRoute extends BaseRoute {
  @override
  String get routePath => "/manager/label/selection";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    var arguments = routeSettings.arguments as LabelSelectionRouteArgs;

    return MaterialPageRoute<List<LabelModel>>(
      builder: (context) => LabelSelectionScreen(arguments),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}

class LabelSelectionRouteArgs {
  int field1;

  LabelSelectionRouteArgs({
    this.field1,
  });
}
