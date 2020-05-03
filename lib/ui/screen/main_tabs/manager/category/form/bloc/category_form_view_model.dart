import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:provider/src/provider.dart';

class CategoryFormViewModel extends ChangeNotifier {
  static CategoryFormViewModel of(BuildContext context) =>
      Provider.of<CategoryFormViewModel>(context);

  CategoryFormViewModel(CategoryModel category) {
    this.category = category;
  }

  CategoryModel _category;

  CategoryModel get category => _category;

  set category(CategoryModel category) {
    _category = category;
    notifyListeners();
  }

  void update({
    String name,
    CategoryModel parent,
  }) {
    category = category.copyWith(
      name: name,
      parent: parent,
    );
  }
}
