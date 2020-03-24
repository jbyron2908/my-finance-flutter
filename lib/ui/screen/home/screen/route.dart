import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_router.dart';
import 'package:my_finance_flutter/ui/screen/home/screen/screen.dart';

class HomeRoute extends BaseRoute {
  @override
  String get routePath => "/home";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => HomeScreen(),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}
