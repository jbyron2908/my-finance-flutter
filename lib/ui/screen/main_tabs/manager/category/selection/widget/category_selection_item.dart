import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/router/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/widget/category_item_view.dart';

class CategorySelectionItem extends StatelessWidget {
  CategorySelectionItem({
    Key key,
    this.category,
    this.notSelectable = false,
  }) : super(key: key);

  final CategoryModel category;
  final bool notSelectable;

  @override
  Widget build(BuildContext context) {
    if (notSelectable) {
      return CategoryItemView(
        category: category,
      );
    } else {
      return CategoryItemView(
        category: category,
        onTap: () => MainTabRouter.of(context).pop(category),
      );
    }
  }
}
