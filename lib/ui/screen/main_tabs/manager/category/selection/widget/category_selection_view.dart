import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/app/router/tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/create/screen/category_create_route.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/selection/widget/category_selection.dart';

class CategorySelectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Category"),
      ),
      body: Container(
        child: CategorySelection(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _navigateToCategoryCreate(context),
      ),
    );
  }

  void _navigateToCategoryCreate(BuildContext context) {
    TabRouter.of(context).navigateTo(CategoryCreateRoute());
  }
}
