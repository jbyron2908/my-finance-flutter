import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:my_finance_flutter/ui/screen/category/widget/item.dart';
import 'package:provider/provider.dart';

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
