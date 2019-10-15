import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/model/tag_model.dart';

class TagItem extends StatelessWidget {
  TagItem({Key key, this.tag}) : super(key: key);

  final TagModel tag;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            tag.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
