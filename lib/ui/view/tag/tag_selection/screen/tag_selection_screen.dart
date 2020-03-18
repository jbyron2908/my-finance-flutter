import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/tag/tag_model.dart';
import 'package:my_finance_flutter/ui/app/router/app_router.dart';
import 'package:my_finance_flutter/ui/common/base/base_screen.dart';
import 'package:my_finance_flutter/ui/common/ui_helpers.dart';
import 'package:my_finance_flutter/ui/view/tag/tag_selection/screen/tag_selection_bloc.dart';
import 'package:my_finance_flutter/ui/view/tag/tag_selection/widget/tag_selection_view.dart';
import 'package:my_finance_flutter/ui/view/tag/widgets/tag_item.dart';
import 'package:provider/provider.dart';

class TagSelectionScreen extends BaseScreen<TagSelectionBloc> {
  TagSelectionScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TagSelectionView();
  }

  @override
  TagSelectionBloc buildBloc(BuildContext context) {
    return TagSelectionBloc();
  }
}

class _TagList extends StatefulWidget {
  _TagList({Key key}) : super(key: key);

  @override
  __TagListState createState() => __TagListState();
}

class __TagListState extends State<_TagList> {
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
