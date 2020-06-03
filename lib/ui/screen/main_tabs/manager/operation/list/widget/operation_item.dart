import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_finance_flutter/core/model/operation/operation_model.dart';
import 'package:my_finance_flutter/ui/common/ui_helpers.dart';

class OperationItem extends StatelessWidget {
  OperationItem({Key key, this.operation}) : super(key: key);

  final OperationModel operation;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      clipBehavior: Clip.antiAlias,
      child: Slidable(
        actionPane: SlidableScrollActionPane(),
        actionExtentRatio: 0.20,
        actions: <Widget>[
          SlideAction(
            color: Colors.blue,
            child: Test(),
          ),
        ],
        secondaryActions: <Widget>[
          IconSlideAction(
            caption: 'More',
            color: Colors.black45,
            icon: Icons.more_horiz,
            onTap: () => _showSnackBar(context, 'More'),
          ),
          IconSlideAction(
            caption: 'Delete',
            color: Colors.red,
            icon: Icons.delete,
            onTap: () => _showSnackBar(context, 'Delete'),
          ),
        ],
        child: Container(
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.info,
                          size: 20,
                          color: Colors.grey,
                        ),
                        UIHelper.horizontalSpaceSmall,
                        Text(
                          '${operation.title}',
                        )
                      ],
                    ),
                    Container(
                      child: Text(
                        'Title: ${operation.category.name}',
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey,
                height: 8,
              ),
              Text(
                'Account: ${operation.account.name}',
              ),
              Divider(
                color: Colors.grey,
                height: 8,
              ),
              Text(
                'Profile: ${operation.profile.name}',
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }
}

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: FlatButton(
            color: Colors.yellow,
            child: Text('Edit'),
            onPressed: () {
              _showSnackBar(context, 'Edit');
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
            child: Text('bbb'),
            onPressed: () {
              _showSnackBar(context, 'bbb');
              Slidable.of(context).close();
            },
          ),
        ),
      ],
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
