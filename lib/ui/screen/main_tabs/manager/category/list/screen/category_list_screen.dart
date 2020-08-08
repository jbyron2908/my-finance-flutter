import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/common/navigation/navigation_handler.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/list/controller/category_list_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/list/widget/category_list_view.dart';

class CategoryListScreen extends StatelessWidget {
  static String get _routeName => '/manager/category/list';
  static RouteDefinition get routeDefinition => RouteDefinition(
        name: _routeName,
        routeBuilder: (routeSetting) => GetPageRoute(
          settings: routeSetting,
          page: () => CategoryListScreen(),
          binding: CategoryListBinding(),
        ),
      );

  static void navigateTo() {
    MainTabRouter.navigateTo(_routeName);
  }

  @override
  Widget build(BuildContext context) {
    return CategoryListView();
  }
}

class CategoryListBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CategoryListController());
  }
}
