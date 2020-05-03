import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/list/widget/item/category_actions.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/list/widget/item/category_view.dart';
import 'package:provider/provider.dart';

class CategoryItem extends StatelessWidget {
  static CategoryModel categoryOf(BuildContext context) =>
      Provider.of<CategoryModel>(context, listen: false);

  CategoryItem({
    Key key,
    this.category,
  }) : super(key: key);

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: category,
      child: CategoryActions(
        child: CategoryView(),
      ),
    );
  }
}
