import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/model/category_model.dart';
import 'package:my_finance_flutter/ui/view/category/category_selection/category_selection_view.dart';

class CategorySelectionRoute {
  static MapEntry get route => MapEntry(_routePath, _generateRoute);

  static String _routePath = "/category/selection";

  static MaterialPageRoute _generateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute<CategoryModel>(
      builder: (context) => CategorySelectionView(),
      settings: routeSettings,
    );
  }

  static Future<CategoryModel> navigateTo(BuildContext context) async {
    return await Navigator.pushNamed(
      context,
      _routePath,
    );
  }
}
