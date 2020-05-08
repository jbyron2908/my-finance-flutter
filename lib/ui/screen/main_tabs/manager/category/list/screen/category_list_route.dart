import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/list/screen/category_list_screen.dart';

class CategoryListRoute extends BaseRoute<CategoryListScreenArgs>
    with MainTabRoute {
  CategoryListRoute.forRouter();

  CategoryListRoute({CategoryListScreenArgs argument})
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
