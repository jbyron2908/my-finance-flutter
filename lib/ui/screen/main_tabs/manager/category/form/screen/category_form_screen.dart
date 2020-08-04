import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:my_finance_flutter/ui/app/app_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/form/controller/category_form_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/form/controller/category_form_view_model.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/form/widget/category_form_view.dart';

class CategoryFormScreen extends StatelessWidget {
  static String get _routePath => '/manager/category/form';
  static GetPageRoute get route => GetPageRoute(
        settings: RouteSettings(
          name: _routePath,
        ),
        page: () => CategoryFormScreen(),
        binding: CategoryFormBinding(),
      );

  static void navigateTo(CategoryFormArg argument) {
    AppRouter.navigateTo(_routePath, argument);
  }

  @override
  Widget build(BuildContext context) {
    return CategoryFormView();
  }
}

class CategoryFormBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CategoryFormController());
    CategoryFormArg arguments = Get.arguments;
    Get.put(CategoryFormViewModel(arguments.category));
  }
}

class CategoryFormArg {
  final CategoryModel category;

  CategoryFormArg(this.category);

  static CategoryFormArg create() {
    var category = CategoryModel();

    return CategoryFormArg(category);
  }

  static CategoryFormArg edit(CategoryModel category) {
    return CategoryFormArg(category);
  }
}
