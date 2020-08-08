import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:my_finance_flutter/ui/common/navigation/navigation_handler.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/form/controller/category_form_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/form/controller/category_form_view_model.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/form/widget/category_form_view.dart';

class CategoryFormScreen extends StatelessWidget {
  static String get _routeName => '/manager/category/form';
  static RouteDefinition get routeDefinition => RouteDefinition(
        name: _routeName,
        routeBuilder: (routeSetting) => GetPageRoute(
          settings: routeSetting,
          page: () => CategoryFormScreen(),
          binding: CategoryFormBinding(),
        ),
      );

  static void navigateTo(CategoryFormArg argument) {
    MainTabRouter.navigateTo(_routeName, argument);
  }

  final CategoryFormViewModel viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    var argument = ModalRoute.of(context).settings.arguments;
    viewModel.setArgument(argument);
    return CategoryFormView();
  }
}

class CategoryFormBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CategoryFormViewModel());
    Get.put(CategoryFormController());
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
