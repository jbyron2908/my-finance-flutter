import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
              _showSnackBar(context, "Copy");
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
            color: Color(0xffE4A854),
            child: Icon(
              Icons.edit,
              color: Colors.white70,
            ),
            onPressed: () {
              _showSnackBar(context, "Edit");
              Slidable.of(context).close();
            },
          ),
        ),
      ],
    );
  }

  _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
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
            onPressed: () {
              _showSnackBar(context, "Delete");
              Slidable.of(context).close();
            },
          ),
        ),
      ],
    );
  }

  _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
