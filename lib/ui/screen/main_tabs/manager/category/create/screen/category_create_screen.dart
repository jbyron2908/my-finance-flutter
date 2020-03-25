import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/repository/category/category_repository.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/create/bloc/category_create_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/create/widget/category_create_view.dart';
import 'package:provider/provider.dart';

class CategoryCreateScreen
    extends BaseScreen<CategoryCreateBloc, CategoryCreateScreenArgs> {
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

class CategoryCreateScreenArgs {
  static CategoryCreateScreenArgs of(BuildContext context) =>
      Provider.of<CategoryCreateScreenArgs>(context, listen: false);

  int field1;

  CategoryCreateScreenArgs({
    this.field1,
  });
}
