import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_finance_flutter/ui/common/dialog_helper.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/list/bloc/category_list_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/list/widget/item/category_item.dart';

class CategoryActions extends StatelessWidget {
  const CategoryActions({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Slidable(
        actionPane: SlidableScrollActionPane(),
        actionExtentRatio: 0.15,
        actions: <Widget>[
          SlideAction(
            child: CategoryActionLeft(),
          ),
        ],
        secondaryActions: <Widget>[
          SlideAction(
            child: CategoryActionRight(),
          ),
        ],
        child: child,
      ),
    );
  }
}

class CategoryActionRight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: FlatButton(
        color: Color(0xffE4A854),
        child: Icon(
          Icons.edit,
          color: Colors.white70,
        ),
        onPressed: () {
          Slidable.of(context).close();
          _edit(context);
        },
      ),
    );
  }

  _edit(BuildContext context) {
    final category = CategoryItem.categoryOf(context);
    final bloc = CategoryListBloc.of(context);
    bloc.editCategory(category);
  }
}

class CategoryActionLeft extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: FlatButton(
        color: Colors.red,
        child: Icon(
          Icons.delete,
          color: Colors.white70,
        ),
        onPressed: () async {
          await _delete(context);
          Slidable.of(context).close();
        },
      ),
    );
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
      final category = CategoryItem.categoryOf(context);
      final bloc = CategoryListBloc.of(context);
      await bloc.deleteCategory(category);
    }
  }
}
