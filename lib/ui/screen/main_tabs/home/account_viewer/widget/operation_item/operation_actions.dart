import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/common/dialog_helper.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/account_viewer/controller/account_viewer_controller.dart';

class OperationActions extends StatelessWidget {
  OperationActions(
    this.index, {
    Key key,
    this.child,
  }) : super(key: key);

  final int index;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      clipBehavior: Clip.antiAlias,
      child: Slidable(
        actionPane: SlidableScrollActionPane(),
        actionExtentRatio: 0.20,
        actions: <Widget>[
          SlideAction(
            color: Colors.blue,
            child: OperationActionLeft(index),
          ),
        ],
        secondaryActions: <Widget>[
          SlideAction(
            color: Colors.blue,
            child: OperationActionRight(index),
          ),
        ],
        child: child,
      ),
    );
  }
}

class OperationActionRight extends StatelessWidget {
  OperationActionRight(
    this.index, {
    Key key,
  }) : super(key: key);

  final int index;
  final AccountViewerController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: FlatButton(
            color: Colors.blue,
            child: Icon(
              Icons.content_copy,
              color: Colors.white70,
            ),
            onPressed: () {
              Slidable.of(context).close();
              _copy();
            },
          ),
        ),
        Divider(
          height: 0,
          color: Colors.white,
        ),
        Expanded(
          child: FlatButton(
            color: Color(0xffE4A854),
            child: Icon(
              Icons.edit,
              color: Colors.white70,
            ),
            onPressed: () {
              Slidable.of(context).close();
              _edit();
            },
          ),
        ),
      ],
    );
  }

  void _edit() {
    controller.editOperation(index);
  }

  void _copy() {
    controller.copyOperation(index);
  }
}

class OperationActionLeft extends StatelessWidget {
  OperationActionLeft(
    this.index, {
    Key key,
  }) : super(key: key);

  final int index;
  final AccountViewerController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: FlatButton(
            color: Colors.green,
            child: Icon(
              Icons.bookmark,
              color: Colors.white70,
            ),
            onPressed: () {
              _showSnackBar(context, 'Bookmark');
              Slidable.of(context).close();
            },
          ),
        ),
        Divider(
          height: 0,
          color: Colors.white,
        ),
        Expanded(
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
        ),
      ],
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
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
