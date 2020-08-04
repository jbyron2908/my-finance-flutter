import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/app/app_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/list/controller/category_list_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/list/widget/category_list_view.dart';

class CategoryListScreen extends StatelessWidget {
  static String get _routePath => '/manager/category/list';
  static GetPageRoute get route => GetPageRoute(
        settings: RouteSettings(
          name: _routePath,
        ),
        page: () => CategoryListScreen(),
        binding: CategoryListBinding(),
      );

  static void navigateTo() {
    AppRouter.navigateTo(_routePath);
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
