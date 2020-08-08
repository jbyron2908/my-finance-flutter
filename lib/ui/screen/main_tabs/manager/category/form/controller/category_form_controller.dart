import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:my_finance_flutter/core/repository/category/category_repository.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/form/controller/category_form_view_model.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/selection/screen/category_selection_screen.dart';

class CategoryFormController extends GetxController {
  final CategoryFormViewModel _viewModel = Get.find();
  final CategoryRepository _categoryRepository = Get.find();

  final formKey = GlobalKey<FormState>();

  void submit() async {
    Get.focusScope.requestFocus(FocusNode());

    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      await _categoryRepository.save(_viewModel.buildForm());
      MainTabRouter.pop();
    }
  }

  void cancel() async {
    MainTabRouter.pop();
  }

  Future<CategoryModel> selectCategory() {
    return CategorySelectionScreen.navigateTo(CategorySelectionArg(true));
  }
}
