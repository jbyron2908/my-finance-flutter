import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/widget/category_item_view.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/widget/category_list.dart';

class CategorySelectionItem extends StatelessWidget {
  CategorySelectionItem({
    Key key,
    this.categoryItem,
  }) : super(key: key);

  final CategoryItemModel categoryItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      clipBehavior: Clip.antiAlias,
      child: ExpansionTile(
        title: Text(categoryItem.parent.name),
        children: [
          ...categoryItem.children.map(
            (child) => ChildCategory(
              child: child,
            ),
          )
        ],
      ),
    );
  }
}

class ChildCategory extends StatelessWidget {
  const ChildCategory({
    Key key,
    @required this.child,
  }) : super(key: key);

  final CategoryModel child;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      clipBehavior: Clip.antiAlias,
      child: CategoryItemView(
        category: child,
        onTap: () => MainTabRouter.pop(child),
      ),
    );
  }
}
