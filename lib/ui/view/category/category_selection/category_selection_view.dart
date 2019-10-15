import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/model/category_model.dart';
import 'package:my_finance_flutter/ui/view/category/widget/category_item.dart';
import 'package:provider/provider.dart';

class CategorySelectionView extends StatelessWidget {
  CategorySelectionView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Category"),
      ),
      body: Container(
        child: _CategoryList(),
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  _CategoryList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<List<CategoryModel>>(
      builder: (_, categoryList, child) => ListView.builder(
        itemCount: categoryList.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () => Navigator.pop(context, categoryList[index]),
          child: CategoryItem(
            category: categoryList[index],
          ),
        ),
      ),
    );
  }
}
