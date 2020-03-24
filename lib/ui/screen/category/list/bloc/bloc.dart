import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/repository/category/category_repository.dart';
import 'package:my_finance_flutter/ui/common/base/bloc/bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/src/provider.dart';

class CategoryListBloc extends BaseBloc {
  static CategoryListBloc of(BuildContext context) =>
      Provider.of<CategoryListBloc>(context, listen: false);

  final CategoryRepository categoryRepository;

  CategoryListBloc({
    this.categoryRepository,
  });

  @override
  List<SingleChildWidget> get dependencies => [];
}
