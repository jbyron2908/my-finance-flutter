import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/model/tag_model.dart';
import 'package:my_finance_flutter/ui/view/tag/widgets/tag_item.dart';
import 'package:provider/provider.dart';

class TagSelectionView extends StatelessWidget {
  TagSelectionView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Tag"),
      ),
      body: Container(
        child: _TagList(),
      ),
    );
  }
}

class _TagList extends StatelessWidget {
  _TagList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<List<TagModel>>(
      builder: (_, tagList, child) => ListView.builder(
        itemCount: tagList.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () => Navigator.pop(context, tagList[index]),
          child: TagItem(
            tag: tagList[index],
          ),
        ),
      ),
    );
  }
}
