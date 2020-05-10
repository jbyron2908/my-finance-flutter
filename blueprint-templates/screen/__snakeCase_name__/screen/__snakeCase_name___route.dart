import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';

class {{pascalCase name}}Route extends BaseRoute<{{pascalCase name}}RouteArgs, void> {
  {{pascalCase name}}Route.forRouter();

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

class {{pascalCase name}}RouteArgs {
  static {{pascalCase name}}RouteArgs of(BuildContext context) =>
    Provider.of<{{pascalCase name}}RouteArgs>(context, listen: false);

  int field1;

  {{pascalCase name}}RouteArgs({
    this.field1,
  });
}
