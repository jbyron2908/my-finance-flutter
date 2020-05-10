import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_route.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/selection/screen/category_selection_screen.dart';
import 'package:provider/provider.dart';

class CategorySelectionRoute
    extends BaseRoute<CategorySelectionRouteArgs, CategoryModel>
    with MainTabRoute {
  CategorySelectionRoute.forRouter();

  CategorySelectionRoute({
    @required CategorySelectionRouteArgs argument,
  }) : super(argument: argument);

  @override
  String get routePath => '/manager/category/selection';

  @override
  MaterialPageRoute<CategoryModel> generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute<CategoryModel>(
      builder: (context) => CategorySelectionScreen(),
      settings: routeSettings,
    );
  }
}

class CategorySelectionRouteArgs {
  static CategorySelectionRouteArgs of(BuildContext context) =>
      Provider.of<CategorySelectionRouteArgs>(context, listen: false);

  bool selectParent;

  CategorySelectionRouteArgs({
    this.selectParent = false,
  });
}
