import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:my_finance_flutter/ui/widgets/item_list/item_list.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    Key key,
    @required this.itemBuilder,
  }) : super(key: key);

  final Widget Function(BuildContext, CategoryItemModel) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return Consumer<List<CategoryModel>>(
      builder: (context, list, child) {
        if (list == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          var parentList = _buildCategoryItemList(list);
          return ItemList(
            modelList: parentList,
            itemBuilder: itemBuilder,
          );
        }
      },
    );
  }

  List<CategoryItemModel> _buildCategoryItemList(
    List<CategoryModel> categoryList,
  ) {
    return categoryList.where((category) => category.parent == null).map(
      (parent) {
        var children = categoryList
            .where(
              (category) => category.parent == parent,
            )
            .toList();

        return CategoryItemModel(parent, children);
      },
    ).toList();
  }
}

class CategoryItemModel {
  CategoryItemModel(
    this.parent,
    this.children,
  );

  CategoryModel parent;
  List<CategoryModel> children;
}
