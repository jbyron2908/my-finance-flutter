import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/model/tag_model.dart';
import 'package:my_finance_flutter/ui/view/tag/widgets/tag_item.dart';
import 'package:provider/provider.dart';

class TagList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<List<TagModel>>(
      builder: (_, tagList, child) => ListView.builder(
        itemCount: tagList.length,
        itemBuilder: (context, index) => TagItem(
          tag: tagList[index],
        ),
      ),
    );
  }
}
