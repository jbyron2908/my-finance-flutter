import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/list/screen/category_list_screen.dart';
import 'package:provider/provider.dart';

class CategoryListRoute extends BaseRoute<CategoryListRouteArgs, void>
    with MainTabRoute {
  CategoryListRoute.forRouter();

  CategoryListRoute({CategoryListRouteArgs argument})
      : super(argument: argument);

  @override
  String get routePath => '/manager/category/list';

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => CategoryListScreen(),
      settings: routeSettings,
    );
  }
}

class CategoryListRouteArgs {
  static CategoryListRouteArgs of(BuildContext context) =>
      Provider.of<CategoryListRouteArgs>(context, listen: false);

  int field1;

  CategoryListRouteArgs({
    this.field1,
  });
}
