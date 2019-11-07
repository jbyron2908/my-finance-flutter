import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/model/category_model.dart';
import 'package:my_finance_flutter/core/provider/repository/category/category_repository.dart';
import 'package:my_finance_flutter/ui/common/base/base_screen.dart';
import 'package:my_finance_flutter/ui/view/category/category_create/screen/category_create_bloc.dart';
import 'package:my_finance_flutter/ui/view/category/category_create/widget/category_create_form.dart';

class CategoryCreateView extends BaseScreen<CategoryCreateBloc> {
  CategoryCreateView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var categoryRepository = CategoryRepository.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Create Category"),
      ),
      body: CategoryCreateForm(onSubmit: (CategoryModel category) async {
        await categoryRepository.save(category);
        Navigator.of(context).pop();
      }),
    );
  }

  @override
  CategoryCreateBloc buildBloc(BuildContext context) {
    return CategoryCreateBloc(
      categoryRepository: CategoryRepository.of(context),
    );
  }
}
