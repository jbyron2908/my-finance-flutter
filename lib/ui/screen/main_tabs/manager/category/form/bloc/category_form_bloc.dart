import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:my_finance_flutter/core/provider/repository/category/category_repository.dart';
import 'package:my_finance_flutter/ui/common/base/bloc/base_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/router/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/form/bloc/category_form_view_model.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/selection/screen/category_selection_route.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/src/provider.dart';

class CategoryFormBloc extends BaseBloc {
  static CategoryFormBloc of(BuildContext context) =>
      Provider.of<CategoryFormBloc>(context, listen: false);

  CategoryFormViewModel _viewModel;
  CategoryRepository _categoryRepository;

  final BuildContext context;
  final formKey = GlobalKey<FormState>();

  CategoryFormBloc(
    this.context, {
    CategoryModel category,
  }) {
    _categoryRepository = CategoryRepository.of(context);
    _viewModel = CategoryFormViewModel(category);
  }

  void submit() async {
    FocusScope.of(context).requestFocus(FocusNode());

    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      await _categoryRepository.save(_viewModel.category);
      MainTabRouter.of(context).pop();
    }
  }

  void cancel() async {
    MainTabRouter.of(context).pop();
  }

  Future<CategoryModel> selectCategory() {
    return CategorySelectionRoute().navigateIntoTab(context);
  }

  @override
  List<SingleChildWidget> get dependencies => [
        ChangeNotifierProvider.value(
          value: _viewModel,
        )
      ];
}
