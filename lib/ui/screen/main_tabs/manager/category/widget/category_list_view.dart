import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:my_finance_flutter/ui/widgets/item_list/item_list.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({
    Key key,
    @required this.categoryList,
    this.itemBuilder,
    this.shrinkWrap = false,
    this.physics,
  }) : super(key: key);

  final List<CategoryModel> categoryList;
  final Widget Function(BuildContext, CategoryModel model) itemBuilder;
  final bool shrinkWrap;
  final ScrollPhysics physics;

  @override
  Widget build(BuildContext context) {
    if (categoryList.isEmpty) {
      return ListTile(
        title: Text('No category'),
      );
    } else {
      return ItemList(
        shrinkWrap: shrinkWrap,
        physics: physics,
        modelList: categoryList,
        itemBuilder: itemBuilder,
      );
    }
  }
}
