import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/repository/category/repository.dart';
import 'package:my_finance_flutter/ui/common/base/screen/screen.dart';
import 'package:my_finance_flutter/ui/screen/category/list/bloc/bloc.dart';
import 'package:my_finance_flutter/ui/screen/category/list/widget/view.dart';

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
