import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';

class {{pascalCase name}}Route extends BaseRoute<{{pascalCase name}}ScreenArgs> {
  {{pascalCase name}}Route({ {{pascalCase name}}ScreenArgs argument })
      : super(argument: argument);

  @override
  String get routePath => "/routeName";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => {{pascalCase name}}Screen(),
      settings: routeSettings,
    );
  }
}
