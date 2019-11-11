import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/model/category_model.dart';
import 'package:my_finance_flutter/ui/app/app_router.dart';
import 'package:my_finance_flutter/ui/view/category/widget/category_item.dart';
import 'package:provider/provider.dart';

class CategorySelection extends StatelessWidget {
  CategorySelection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<List<CategoryModel>>(
      builder: (_, categoryList, child) => ListView.builder(
        itemCount: categoryList.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () => AppRouter.pop(context, categoryList[index]),
          child: CategoryItem(
            category: categoryList[index],
          ),
        ),
      ),
    );
  }
}
