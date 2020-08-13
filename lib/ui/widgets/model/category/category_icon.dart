import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:my_finance_flutter/ui/widgets/common/icon/circle_icon.dart';

class CategoryIcon extends StatelessWidget {
  const CategoryIcon(
    this.categoryModel, {
    Key key,
  }) : super(key: key);

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      child: Stack(
        children: [
          CircleIcon(
            categoryModel.icon,
            circleSize: 40,
            iconSize: 28,
          ),
          (categoryModel.parent != null)
              ? Align(
                  alignment: Alignment.bottomRight,
                  child: CircleIcon(
                    categoryModel.parent.icon,
                    circleSize: 20,
                    iconSize: 12,
                  ),
                )
              : null
        ],
      ),
    );
  }
}
