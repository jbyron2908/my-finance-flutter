import 'package:flutter/material.dart';

class ListRow extends StatelessWidget {
  const ListRow({
    Key key,
    @required this.onTap,
    this.title,
    this.leading,
    this.trailing,
  }) : super(key: key);

  final void Function() onTap;
  final Widget title;
  final Widget leading;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
        title: title,
        leading: leading,
        trailing: trailing,
        onTap: onTap,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0, color: Colors.grey),
        ),
      ),
    );
  }
}
