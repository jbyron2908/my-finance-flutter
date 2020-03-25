import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/repository/category/category_repository.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/selection/bloc/category_selection_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/selection/widget/category_selection_view.dart';
import 'package:provider/provider.dart';

class CategorySelectionScreen
    extends BaseScreen<CategorySelectionBloc, CategorySelectionScreenArgs> {
  @override
  Widget build(BuildContext context) {
    return CategorySelectionView();
  }

  @override
  CategorySelectionBloc buildBloc(BuildContext context) {
    return CategorySelectionBloc(
      categoryRepository: CategoryRepository.of(context),
    );
  }
}

class CategorySelectionScreenArgs {
  static CategorySelectionScreenArgs of(BuildContext context) =>
      Provider.of<CategorySelectionScreenArgs>(context, listen: false);

  int field1;

  CategorySelectionScreenArgs({
    this.field1,
  });
}
