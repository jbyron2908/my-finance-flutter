import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:my_finance_flutter/core/repository/category/category_repository.dart';
import 'package:my_finance_flutter/ui/common/base/bloc/base_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/form/screen/category_form_route.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/src/provider.dart';

class CategoryListBloc extends BaseBloc {
  static CategoryListBloc of(BuildContext context) =>
      Provider.of<CategoryListBloc>(context, listen: false);

  final BuildContext context;
  CategoryRepository _categoryRepository;

  CategoryListBloc({
    @required this.context,
  }) {
    _categoryRepository = CategoryRepository.of(context);
  }

  Future deleteCategory(CategoryModel category) {
    return _categoryRepository.delete(category);
  }

  void editCategory(CategoryModel category) {
    CategoryFormRoute(
      argument: CategoryFormRouteArgs.edit(category: category),
    ).navigateIntoTab(context);
  }

  @override
  List<SingleChildWidget> get dependencies => [];
}
