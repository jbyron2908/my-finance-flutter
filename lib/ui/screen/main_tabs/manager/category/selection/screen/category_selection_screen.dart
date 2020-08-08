import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:my_finance_flutter/ui/common/navigation/navigation_handler.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/selection/controller/category_selection_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/selection/widget/category_selection_view.dart';

class CategorySelectionScreen extends StatelessWidget {
  static String get _routeName => '/manager/account/selection';
  static RouteDefinition get routeDefinition => RouteDefinition(
        name: _routeName,
        routeBuilder: (routeSetting) => GetPageRoute<CategoryModel>(
          settings: routeSetting,
          page: () => CategorySelectionScreen(),
          binding: CategorySelectionBinding(),
        ),
      );

  static Future<CategoryModel> navigateTo(CategorySelectionArg arg) {
    return MainTabRouter.navigateTo(_routeName, arg);
  }

  @override
  Widget build(BuildContext context) {
    CategorySelectionArg argument = Get.arguments;
    return CategorySelectionView(argument.selectParent);
  }
}

class CategorySelectionBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CategorySelectionController());
  }
}

class CategorySelectionArg {
  bool selectParent;

  CategorySelectionArg([this.selectParent = false]);
}
