import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/base_router.dart';

class {{pascalCase name}}Route extends BaseRoute {
  @override
  String get routePath => "/account/create";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => {{pascalCase name}}Screen(),
      settings: routeSettings,
    );
  }

  @override
  Object get arguments => null;
}
