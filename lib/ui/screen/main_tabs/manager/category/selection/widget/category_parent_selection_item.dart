import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/widget/category_item_view.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/widget/category_list.dart';

class CategoryParentSelectionItem extends StatelessWidget {
  CategoryParentSelectionItem({
    Key key,
    this.categoryItem,
  }) : super(key: key);

  final CategoryItemModel categoryItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      clipBehavior: Clip.antiAlias,
      child: CategoryItemView(
        category: categoryItem.parent,
        onTap: () => MainTabRouter.of(context).pop(categoryItem.parent),
      ),
    );
  }
}
