import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/category/index.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/list/widget/category_list.dart';
import 'package:provider/provider.dart';

class CategoryListMock extends StatelessWidget {
  const CategoryListMock({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Provider.value(
        value: List<CategoryModel>.generate(10, (index) {
          var categoryModel = CategoryModel(name: "$index");
          return categoryModel;
        }),
        child: CategoryList(),
      ),
    );
  }
}
