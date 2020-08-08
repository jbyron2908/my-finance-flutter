import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:my_finance_flutter/ui/app/app_data_controller.dart';
import 'package:my_finance_flutter/ui/widgets/item_list/item_list.dart';

class CategoryList extends StatelessWidget {
  CategoryList({
    Key key,
    @required this.itemBuilder,
  }) : super(key: key);

  final Widget Function(BuildContext, CategoryItemModel) itemBuilder;
  final AppDataController appDataController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        var categoryList = appDataController.categoryList.value;
        if (categoryList == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          var parentList = _buildCategoryItemList(categoryList);
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
