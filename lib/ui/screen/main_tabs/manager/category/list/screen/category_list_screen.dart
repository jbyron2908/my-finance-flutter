import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/repository/category/category_repository.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/list/bloc/category_list_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/list/widget/category_list_view.dart';
import 'package:provider/provider.dart';

class CategoryListScreen
    extends BaseScreen<CategoryListBloc, CategoryListScreenArgs> {
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

class CategoryListScreenArgs {
  static CategoryListScreenArgs of(BuildContext context) =>
      Provider.of<CategoryListScreenArgs>(context, listen: false);

  int field1;

  CategoryListScreenArgs({
    this.field1,
  });
}
