import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/list/widget/item/category_item.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatelessWidget {
  CategoryList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<List<CategoryModel>>(
      builder: (_, categoryList, child) => ListView.separated(
        itemCount: categoryList.length,
        itemBuilder: (context, index) => CategoryItem(
          category: categoryList[index],
        ),
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
        ),
      ),
    );
  }
}
