import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/category/model.dart';
import 'package:my_finance_flutter/core/provider/repository/category/repository.dart';
import 'package:my_finance_flutter/ui/common/base/bloc/bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/src/provider.dart';

class CategoryCreateBloc extends BaseBloc {
  static CategoryCreateBloc of(BuildContext context) =>
      Provider.of<CategoryCreateBloc>(context, listen: false);

  final CategoryRepository categoryRepository;

  CategoryCreateBloc({
    this.categoryRepository,
  });

  @override
  List<SingleChildWidget> get dependencies => [];

  Future saveAccount(CategoryModel account) {
    return categoryRepository.save(account);
  }
}