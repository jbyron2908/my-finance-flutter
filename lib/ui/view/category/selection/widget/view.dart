import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/app/router/app_router.dart';
import 'package:my_finance_flutter/ui/view/category/create/screen/route.dart';
import 'package:my_finance_flutter/ui/view/category/selection/widget/selection.dart';

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
    AppRouter.navigateTo(context, CategoryCreateRoute());
  }
}
