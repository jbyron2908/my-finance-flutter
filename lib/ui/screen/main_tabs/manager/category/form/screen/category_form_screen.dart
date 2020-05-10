import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/form/bloc/category_form_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/form/screen/category_form_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/form/widget/category_form_view.dart';

class CategoryFormScreen
    extends BaseScreen<CategoryFormBloc, CategoryFormRouteArgs> {
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
