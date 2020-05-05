import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:my_finance_flutter/ui/common/dialog_helper.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/list/bloc/category_list_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/widget/category_item_view.dart';
import 'package:my_finance_flutter/ui/widgets/item_list/item_actions.dart';

class CategoryListItem extends StatelessWidget {
  CategoryListItem({
    Key key,
    this.category,
  }) : super(key: key);

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ItemActions(
      onDelete: () => _delete(context),
      onEdit: () => _edit(context),
      child: CategoryItemView(
        category: category,
      ),
    );
  }

  _edit(BuildContext context) {
    final bloc = CategoryListBloc.of(context);
    bloc.editCategory(category);
  }

  Future _delete(BuildContext context) async {
    var confirmation = await DialogHelper.showAlertDialog(
      context,
      title: "Delete category",
      content: "Do you want to delete this category?",
      confirmText: "Yes",
      cancelText: "No",
    );

    if (confirmation == true) {
      final bloc = CategoryListBloc.of(context);
      await bloc.deleteCategory(category);
    }
  }
}
