import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/category/index.dart';
import 'package:my_finance_flutter/core/provider/repository/category/category_repository.dart';
import 'package:my_finance_flutter/ui/common/base/bloc/base_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/src/provider.dart';

class CategoryFormBloc extends BaseBloc {
  static CategoryFormBloc of(BuildContext context) =>
      Provider.of<CategoryFormBloc>(context, listen: false);

  final CategoryRepository categoryRepository;

  CategoryFormBloc({
    this.categoryRepository,
  });

  @override
  List<SingleChildWidget> get dependencies => [];

  Future saveAccount(CategoryModel account) {
    return categoryRepository.save(account);
  }
}
