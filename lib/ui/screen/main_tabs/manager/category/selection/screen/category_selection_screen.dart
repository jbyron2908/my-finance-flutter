import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/repository/category/category_repository.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/selection/bloc/category_selection_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/selection/screen/category_selection_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/selection/widget/category_selection_view.dart';

class CategorySelectionScreen
    extends BaseScreen<CategorySelectionBloc, CategorySelectionRouteArgs> {
  @override
  Widget build(BuildContext context) {
    var argument = getArgument(context);

    return CategorySelectionView(
      selectParent: argument.selectParent,
    );
  }

  @override
  CategorySelectionBloc buildBloc(BuildContext context) {
    return CategorySelectionBloc(
      categoryRepository: CategoryRepository.of(context),
    );
  }
}
