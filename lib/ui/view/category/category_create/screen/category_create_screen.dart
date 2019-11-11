import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/repository/category/category_repository.dart';
import 'package:my_finance_flutter/ui/common/base/base_screen.dart';
import 'package:my_finance_flutter/ui/view/category/category_create/screen/category_create_bloc.dart';
import 'package:my_finance_flutter/ui/view/category/category_create/widget/category_create_view.dart';

class CategoryCreateScreen extends BaseScreen<CategoryCreateBloc> {
  @override
  Widget build(BuildContext context) {
    return CategoryCreateView();
  }

  @override
  CategoryCreateBloc buildBloc(BuildContext context) {
    return CategoryCreateBloc(
      categoryRepository: CategoryRepository.of(context),
    );
  }
}
