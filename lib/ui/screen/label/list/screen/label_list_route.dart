import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_router.dart';
import 'package:my_finance_flutter/ui/screen/label/list/screen/label_list_screen.dart';

class LabelListRoute extends BaseRoute {
  @override
  String get routePath => "/label/list";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => LabelListScreen(),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}
