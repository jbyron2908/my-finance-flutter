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
        child: CategoryList(),
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

class CategoryList extends StatelessWidget {
  CategoryList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<List<CategoryModel>>(
      builder: (_, categoryList, child) {
        return ListView.builder(
          itemCount: categoryList.length,
          itemBuilder: (context, index) {
            return CategoryItem(
              category: categoryList[index],
            );
          },
        );
      },
    );
  }
}
