import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:my_finance_flutter/core/provider/repository/category/category_repository.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/form/widget/category_form.dart';

class CategoryFormView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var categoryRepository = CategoryRepository.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Form Category"),
      ),
      body: CategoryForm(onSubmit: (CategoryModel category) async {
        await categoryRepository.save(category);
        Navigator.of(context).pop();
      }),
    );
  }
}
