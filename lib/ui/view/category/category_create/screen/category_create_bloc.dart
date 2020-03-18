import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:my_finance_flutter/core/provider/repository/category/category_repository.dart';
import 'package:my_finance_flutter/ui/common/base/base_bloc.dart';
import 'package:provider/src/provider.dart';

class CategoryCreateBloc extends BaseBloc {
  static CategoryCreateBloc of(BuildContext context) =>
      Provider.of<CategoryCreateBloc>(context);

  final CategoryRepository categoryRepository;

  CategoryCreateBloc({
    this.categoryRepository,
  });

  @override
  List<SingleChildCloneableWidget> get dependencies => [];

  Future saveAccount(CategoryModel account) {
    return categoryRepository.save(account);
  }
}
