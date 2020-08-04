import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:my_finance_flutter/ui/app/app_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/selection/controller/category_selection_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/selection/widget/category_selection_view.dart';

class CategorySelectionScreen extends StatelessWidget {
  static String get _routePath => '/manager/account/selection';
  static GetPageRoute get route => GetPageRoute<CategoryModel>(
        settings: RouteSettings(
          name: _routePath,
        ),
        page: () => CategorySelectionScreen(),
        binding: CategorySelectionBinding(),
      );

  static Future<CategoryModel> navigateTo(CategorySelectionArg arg) {
    return AppRouter.navigateTo(_routePath, arg);
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
