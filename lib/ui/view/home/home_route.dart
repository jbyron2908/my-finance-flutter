import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/base_router.dart';
import 'package:my_finance_flutter/ui/view/home/home_view.dart';

class HomeRoute extends BaseRoute {
  @override
  String get routePath => "/home";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => HomeView(),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}
