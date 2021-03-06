import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/form/screen/category_form_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/list/widget/category_list_item.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/widget/category_list.dart';

class CategoryListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: CategoryList(
        itemBuilder: (context, categoryItem) => CategoryListItem(
          categoryItem: categoryItem,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _navigateToCategoryForm(context),
      ),
    );
  }

  void _navigateToCategoryForm(BuildContext context) {
    CategoryFormRoute(
      argument: CategoryFormRouteArgs.create(),
    ).navigateIntoTab(context);
  }
}
