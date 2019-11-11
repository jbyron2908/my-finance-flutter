import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/repository/category/category_repository.dart';
import 'package:my_finance_flutter/ui/common/base/base_screen.dart';
import 'package:my_finance_flutter/ui/view/category/category_list/screen/category_list_bloc.dart';
import 'package:my_finance_flutter/ui/view/category/category_list/widget/category_list_view.dart';

class CategoryListScreen extends BaseScreen<CategoryListBloc> {
  @override
  Widget build(BuildContext context) {
    return CategoryListView();
  }

  @override
  CategoryListBloc buildBloc(BuildContext context) {
    return CategoryListBloc(
      categoryRepository: CategoryRepository.of(context),
    );
  }
}
