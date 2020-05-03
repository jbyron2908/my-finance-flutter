import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
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
    var argument = getArgument(context);

    return CategoryFormBloc(
      context,
      category: argument.category,
    );
  }
}

class CategoryFormScreenArgs {
  static CategoryFormScreenArgs of(BuildContext context) =>
      Provider.of<CategoryFormScreenArgs>(context, listen: false);

  CategoryModel category;

  CategoryFormScreenArgs({
    this.category,
  });

  static CategoryFormScreenArgs create() {
    var category = CategoryModel();

    return CategoryFormScreenArgs(
      category: category,
    );
  }

  static CategoryFormScreenArgs edit({
    CategoryModel category,
  }) {
    return CategoryFormScreenArgs(
      category: category,
    );
  }
}
