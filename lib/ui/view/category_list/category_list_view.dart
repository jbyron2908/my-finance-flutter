import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/model/category_model.dart';
import 'package:my_finance_flutter/core/provider/repository/category/category_repository.dart';
import 'package:my_finance_flutter/ui/app/app_router.dart';
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
  @override
  Widget build(BuildContext context) {
    var categoryRepository = CategoryRepository.of(context);
    return StreamProvider<List<CategoryModel>>.value(
      value: categoryRepository.categoryListStream,
      initialData: List(),
      child: Consumer<List<CategoryModel>>(
        builder: (_, categoryList, child) => ListView.builder(
          itemCount: categoryList.length,
          itemBuilder: (context, index) => CategoryItem(categoryList[index]),
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  const CategoryItem(this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            category.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
