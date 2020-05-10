import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/form/screen/category_form_screen.dart';
import 'package:provider/provider.dart';

class CategoryFormRoute extends BaseRoute<CategoryFormRouteArgs, void>
    with MainTabRoute {
  CategoryFormRoute.forRouter();

  CategoryFormRoute({
    @required CategoryFormRouteArgs argument,
  }) : super(argument: argument);

  @override
  String get routePath => '/manager/category/create';

  @override
  MaterialPageRoute generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
      builder: (context) => CategoryFormScreen(),
      settings: routeSettings,
    );
  }
}

class CategoryFormRouteArgs {
  static CategoryFormRouteArgs of(BuildContext context) =>
      Provider.of<CategoryFormRouteArgs>(context, listen: false);

  CategoryModel category;

  CategoryFormRouteArgs({
    this.category,
  });

  static CategoryFormRouteArgs create() {
    var category = CategoryModel();

    return CategoryFormRouteArgs(
      category: category,
    );
  }

  static CategoryFormRouteArgs edit({
    CategoryModel category,
  }) {
    return CategoryFormRouteArgs(
      category: category,
    );
  }
}
