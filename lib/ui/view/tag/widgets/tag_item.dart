import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/tag/tag_model.dart';

class TagItem extends StatelessWidget {
  TagItem({Key key, this.tag}) : super(key: key);

  final TagModel tag;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          tag.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
