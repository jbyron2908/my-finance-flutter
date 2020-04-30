import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_finance_flutter/ui/common/dialog_helper.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/account_viewer/bloc/account_viewer_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/home/account_viewer/widget/operation_item/operation_item.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/form/screen/operation_form_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/form/screen/operation_form_screen.dart';

class OperationActions extends StatelessWidget {
  const OperationActions({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Slidable(
        actionPane: SlidableScrollActionPane(),
        actionExtentRatio: 0.20,
        actions: <Widget>[
          SlideAction(
            color: Colors.blue,
            child: OperationActionLeft(),
          ),
        ],
        secondaryActions: <Widget>[
          SlideAction(
            color: Colors.blue,
            child: OperationActionRight(),
          ),
        ],
        child: child,
      ),
    );
  }
}

class OperationActionRight extends StatelessWidget {
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
              _copy(context);
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
              _edit(context);
            },
          ),
        ),
      ],
    );
  }

  _edit(BuildContext context) {
    var operation = OperationItem.operationOf(context);
    MainTabRouter.of(context).navigateTo(
      OperationFormRoute(
        argument: OperationFormScreenArgs.edit(
          operation: operation,
        ),
      ),
    );
  }

  _copy(BuildContext context) {
    var operation = OperationItem.operationOf(context);
    MainTabRouter.of(context).navigateTo(
      OperationFormRoute(
        argument: OperationFormScreenArgs.copy(
          operation: operation,
        ),
      ),
    );
  }
}

class OperationActionLeft extends StatelessWidget {
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
              _showSnackBar(context, "Bookmark");
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
      title: "Delete operation",
      content: "Do you want to delete this operation?",
      confirmText: "Yes",
      cancelText: "No",
    );

    if (confirmation == true) {
      final operation = OperationItem.operationOf(context);
      final bloc = AccountViewerBloc.of(context);
      await bloc.deleteOperation(operation);
    }
  }

  _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
