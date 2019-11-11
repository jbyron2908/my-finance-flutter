import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/model/tag_model.dart';
import 'package:my_finance_flutter/ui/app/app_router.dart';
import 'package:my_finance_flutter/ui/view/tag/tag_create/screen/tag_create_route.dart';
import 'package:my_finance_flutter/ui/view/tag/widgets/tag_item.dart';
import 'package:provider/provider.dart';

class TagListView extends StatelessWidget {
  TagListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tags"),
      ),
      body: Container(
        child: _TagList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _navigateToTagCreate(context),
      ),
    );
  }

  void _navigateToTagCreate(BuildContext context) {
    AppRouter.navigateTo(context, TagCreateRoute());
  }
}

class _TagList extends StatelessWidget {
  _TagList({Key key}) : super(key: key);

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
