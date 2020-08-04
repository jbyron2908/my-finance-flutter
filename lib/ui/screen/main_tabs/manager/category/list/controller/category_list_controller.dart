import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:my_finance_flutter/core/repository/category/category_repository.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/form/screen/category_form_screen.dart';

class CategoryListController extends GetxController {
  final CategoryRepository _categoryRepository = Get.find();

  Future deleteCategory(CategoryModel category) {
    return _categoryRepository.delete(category);
  }

  void editCategory(CategoryModel category) {
    CategoryFormScreen.navigateTo(CategoryFormArg.edit(category));
  }
}
