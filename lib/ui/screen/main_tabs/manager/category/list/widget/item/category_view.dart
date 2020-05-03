import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/list/widget/item/category_item.dart';

class CategoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var category = CategoryItem.categoryOf(context);

    return Container(
      child: ListTile(
        title: Text(category.name),
      ),
    );
  }
}
