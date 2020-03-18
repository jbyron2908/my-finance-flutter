import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/tag/tag_model.dart';
import 'package:my_finance_flutter/ui/app/router/app_router.dart';
import 'package:my_finance_flutter/ui/common/ui_helpers.dart';
import 'package:my_finance_flutter/ui/view/tag/widgets/tag_item.dart';
import 'package:provider/provider.dart';

class TagSelection extends StatefulWidget {
  @override
  _TagSelectionState createState() => _TagSelectionState();
}

class _TagSelectionState extends State<TagSelection> {
  List<TagModel> selectedTagList = List();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Consumer<List<TagModel>>(
            builder: (_, tagList, child) => ListView(
              shrinkWrap: true,
              children: <Widget>[
                ...tagList.map(
                  (item) => InkWell(
                    onTap: () => tapItem(item),
                    child: Container(
                      color: getColor(item),
                      child: TagItem(
                        tag: item,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          UIHelper.verticalSpaceSmall,
          RaisedButton(
            child: Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              AppRouter.pop(context, selectedTagList);
            },
            color: Colors.green,
          ),
        ],
      ),
    );
  }

  Color getColor(TagModel item) {
    return selectedTagList.contains(item) ? Colors.green : Colors.transparent;
  }

  void tapItem(TagModel item) {
    setState(() {
      selectedTagList.contains(item)
          ? selectedTagList.remove(item)
          : selectedTagList.add(item);
    });
  }
}
