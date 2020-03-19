import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/tag/model.dart';
import 'package:my_finance_flutter/ui/app/router/app_router.dart';
import 'package:my_finance_flutter/ui/screen/tag/create/screen/route.dart';
import 'package:my_finance_flutter/ui/screen/tag/widgets/item.dart';
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