import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/model/category_model.dart';
import 'package:my_finance_flutter/ui/app/app_router.dart';
import 'package:my_finance_flutter/ui/view/category/widget/category_item.dart';
import 'package:provider/provider.dart';

class CategoryListView extends StatelessWidget {
  CategoryListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
      ),
      body: Container(
        child: _CategoryList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _navigateToCategoryCreate(context),
      ),
    );
  }

  void _navigateToCategoryCreate(BuildContext context) {
    AppRouter.navigateToCategoryCreate(context);
  }
}

class _CategoryList extends StatelessWidget {
  _CategoryList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<List<CategoryModel>>(
      builder: (_, categoryList, child) => ListView.builder(
        itemCount: categoryList.length,
        itemBuilder: (context, index) => CategoryItem(
          category: categoryList[index],
        ),
      ),
    );
  }
}
