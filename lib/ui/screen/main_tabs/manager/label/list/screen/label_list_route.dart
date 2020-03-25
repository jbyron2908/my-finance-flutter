import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/list/screen/label_list_screen.dart';

class LabelListRoute extends BaseRoute<LabelListScreenArgs> {
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
