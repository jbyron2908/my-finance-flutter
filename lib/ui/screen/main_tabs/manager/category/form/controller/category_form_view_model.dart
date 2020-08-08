import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/form/screen/category_form_screen.dart';

class CategoryFormViewModel extends ChangeNotifier {
  final RxString name = ''.obs;
  final Rx<CategoryModel> parent = Rx();

  CategoryFormArg argument;

  void setArgument(CategoryFormArg argument) {
    this.argument = argument;
    var category = argument.category;

    name.value = category.name;
    parent.value = category.parent;
  }

  CategoryModel buildForm() {
    var category = argument.category;

    return category.copyWith(
      name: name.value,
      parent: parent.value,
    );
  }
}
