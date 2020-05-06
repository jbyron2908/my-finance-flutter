import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ItemActions extends StatelessWidget {
  const ItemActions({
    Key key,
    this.child,
    this.onEdit,
    this.onDelete,
  }) : super(key: key);

  final Widget child;
  final void Function() onEdit;
  final void Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Slidable(
        actionPane: SlidableScrollActionPane(),
        actionExtentRatio: 0.15,
        actions: <Widget>[
          SlideAction(
            child: _ActionLeft(
              onDelete: onDelete,
            ),
          ),
        ],
        secondaryActions: <Widget>[
          SlideAction(
            child: _ActionRight(
              onEdit: onEdit,
            ),
          ),
        ],
        child: child,
      ),
    );
  }
}

class _ActionRight extends StatelessWidget {
  const _ActionRight({
    Key key,
    this.onEdit,
  }) : super(key: key);

  final void Function() onEdit;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: FlatButton(
        color: Color(0xffE4A854),
        child: Icon(
          Icons.edit,
          color: Colors.white70,
        ),
        onPressed: () async {
          Slidable.of(context).close();
          await onEdit();
        },
      ),
    );
  }
}

class _ActionLeft extends StatelessWidget {
  const _ActionLeft({
    Key key,
    this.onDelete,
  }) : super(key: key);

  final void Function() onDelete;

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
          Slidable.of(context).close();
          await onDelete();
        },
      ),
    );
  }
}
