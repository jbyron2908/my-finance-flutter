import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/app/router/app_router.dart';
import 'package:my_finance_flutter/ui/view/category/create/screen/route.dart';
import 'package:my_finance_flutter/ui/view/category/list/widget/list.dart';

class CategoryListView extends StatelessWidget {
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
    AppRouter.navigateTo(context, CategoryCreateRoute());
  }
}
