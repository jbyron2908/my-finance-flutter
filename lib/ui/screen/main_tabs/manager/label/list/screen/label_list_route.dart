import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/router/main_tab_route_mixin.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/list/screen/label_list_screen.dart';

class LabelListRoute extends BaseRoute<LabelListScreenArgs> with MainTabRoute {
  LabelListRoute.forRouter();

  LabelListRoute({LabelListScreenArgs argument}) : super(argument: argument);

  @override
  String get routePath => "/manager/label/list";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => LabelListScreen(),
      settings: routeSettings,
    );
  }
}
