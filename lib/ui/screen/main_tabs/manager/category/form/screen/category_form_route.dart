import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/router/main_tab_route_mixin.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/form/screen/category_form_screen.dart';

class CategoryFormRoute extends BaseRoute<CategoryFormScreenArgs>
    with MainTabRoute {
  CategoryFormRoute.forRouter();

  CategoryFormRoute({
    @required CategoryFormScreenArgs argument,
  }) : super(argument: argument);

  @override
  String get routePath => "/manager/category/create";

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => CategoryFormScreen(),
      settings: routeSettings,
    );
  }
}
