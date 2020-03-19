import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/tag/model.dart';
import 'package:my_finance_flutter/ui/screen/tag/widgets/item.dart';
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
