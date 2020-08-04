import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:my_finance_flutter/ui/common/dialog_helper.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/list/controller/category_list_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/widget/category_item_view.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/widget/category_list.dart';
import 'package:my_finance_flutter/ui/widgets/item_list/item_actions.dart';

class CategoryListItem extends StatelessWidget {
  CategoryListItem({
    Key key,
    this.categoryItem,
  }) : super(key: key);

  final CategoryItemModel categoryItem;

  final CategoryListController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      clipBehavior: Clip.antiAlias,
      child: ItemActions(
        onDelete: () => _delete(context, categoryItem.parent),
        onEdit: () => _edit(context, categoryItem.parent),
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
      ),
    );
  }

  void _edit(BuildContext context, CategoryModel category) {
    controller.editCategory(category);
  }

  Future _delete(BuildContext context, CategoryModel category) async {
    var confirmation = await DialogHelper.showAlertDialog(
      context,
      title: 'Delete category',
      content: 'Do you want to delete this category?',
      confirmText: 'Yes',
      cancelText: 'No',
    );

    if (confirmation == true) {
      await controller.deleteCategory(category);
    }
  }
}

class ChildCategory extends StatelessWidget {
  ChildCategory({
    Key key,
    @required this.child,
  }) : super(key: key);

  final CategoryModel child;
  final CategoryListController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      clipBehavior: Clip.antiAlias,
      child: ItemActions(
        onDelete: () => _delete(context, child),
        onEdit: () => _edit(context, child),
        child: CategoryItemView(
          category: child,
        ),
      ),
    );
  }

  void _edit(BuildContext context, CategoryModel category) {
    controller.editCategory(category);
  }

  Future _delete(BuildContext context, CategoryModel category) async {
    var confirmation = await DialogHelper.showAlertDialog(
      context,
      title: 'Delete category',
      content: 'Do you want to delete this category?',
      confirmText: 'Yes',
      cancelText: 'No',
    );

    if (confirmation == true) {
      await controller.deleteCategory(category);
    }
  }
}
