import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/common/dialog_helper.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/account_viewer/controller/account_viewer_controller.dart';

class OperationActions extends StatelessWidget {
  OperationActions(
    this.index, {
    Key key,
    @required this.child,
  }) : super(key: key);

  final int index;
  final Widget child;

  final AccountViewerController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      clipBehavior: Clip.antiAlias,
      child: Slidable(
        closeOnScroll: true,
        actionPane: SlidableStrechActionPane(),
        actionExtentRatio: 0.20,
        actions: <Widget>[
          IconSlideAction(
            caption: 'Bookmark',
            color: Colors.blue,
            icon: Icons.bookmark,
            closeOnTap: true,
            onTap: () {
              _showSnackBar(context, 'Bookmark');
            },
          ),
          IconSlideAction(
            caption: 'Delete',
            color: Colors.red,
            icon: Icons.delete,
            closeOnTap: true,
            onTap: () {
              _delete(context);
            },
          ),
        ],
        secondaryActions: <Widget>[
          IconSlideAction(
            caption: 'Copy',
            color: Colors.blue,
            icon: Icons.content_copy,
            closeOnTap: true,
            onTap: () {
              _copy();
            },
          ),
          IconSlideAction(
            caption: 'Edit',
            color: Color(0xffE4A854),
            foregroundColor: Colors.white,
            icon: Icons.edit,
            closeOnTap: true,
            onTap: () {
              _edit();
            },
          ),
        ],
        child: child,
      ),
    );
  }

  Future _delete(BuildContext context) async {
    var confirmation = await DialogHelper.showAlertDialog(
      context,
      title: 'Delete operation',
      content: 'Do you want to delete this operation?',
      confirmText: 'Yes',
      cancelText: 'No',
    );

    if (confirmation == true) {
      await controller.deleteOperation(index);
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _edit() {
    controller.editOperation(index);
  }

  void _copy() {
    controller.copyOperation(index);
  }
}
