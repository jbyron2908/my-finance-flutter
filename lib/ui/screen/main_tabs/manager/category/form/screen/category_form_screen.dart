import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/repository/category/category_repository.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/form/bloc/category_form_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/form/widget/category_form_view.dart';
import 'package:provider/provider.dart';

class CategoryFormScreen
    extends BaseScreen<CategoryFormBloc, CategoryFormScreenArgs> {
  @override
  Widget build(BuildContext context) {
    return CategoryFormView();
  }

  @override
  CategoryFormBloc buildBloc(BuildContext context) {
    return CategoryFormBloc(
      categoryRepository: CategoryRepository.of(context),
    );
  }
}

class CategoryFormScreenArgs {
  static CategoryFormScreenArgs of(BuildContext context) =>
      Provider.of<CategoryFormScreenArgs>(context, listen: false);

  int field1;

  CategoryFormScreenArgs({
    this.field1,
  });
}
