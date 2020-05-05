import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';

class CategoryItemView extends StatelessWidget {
  CategoryItemView({
    Key key,
    @required this.category,
    this.onTap,
    this.onLongPress,
  }) : super(key: key);

  final CategoryModel category;
  final Function() onTap;
  final Function() onLongPress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(category.name),
      onTap: onTap,
      onLongPress: onLongPress,
    );
  }
}
