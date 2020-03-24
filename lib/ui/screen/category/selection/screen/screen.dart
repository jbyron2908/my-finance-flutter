import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/repository/category/category_repository.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/category/selection/bloc/bloc.dart';
import 'package:my_finance_flutter/ui/screen/category/selection/widget/view.dart';

class CategorySelectionScreen extends BaseScreen<CategorySelectionBloc> {
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
