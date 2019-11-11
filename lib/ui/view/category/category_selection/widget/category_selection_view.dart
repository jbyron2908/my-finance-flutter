import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/view/category/category_selection/widget/category_selection.dart';

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
    );
  }
}
