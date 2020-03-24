import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:my_finance_flutter/ui/app/router/app_router.dart';
import 'package:my_finance_flutter/ui/common/ui_helpers.dart';
import 'package:my_finance_flutter/ui/screen/category/selection/screen/category_selection_route.dart';
import 'package:my_finance_flutter/ui/widgets/form/form_field_decorator.dart';

class CategoryCreateForm extends StatefulWidget {
  CategoryCreateForm({Function(CategoryModel category) onSubmit})
      : onSubmit = onSubmit;

  final Function(CategoryModel category) onSubmit;

  @override
  CategoryCreateFormState createState() =>
      CategoryCreateFormState(onSubmit: onSubmit);
}

class CategoryCreateFormState extends State<CategoryCreateForm> {
  CategoryCreateFormState({Function(CategoryModel category) onSubmit})
      : onSubmit = onSubmit;

  final Function(CategoryModel category) onSubmit;
  final CategoryModel category = CategoryModel();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Form(
          key: this._formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                ...buildFormFields(),
                UIHelper.verticalSpaceSmall,
                RaisedButton(
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    submit();
                  },
                  color: Colors.green,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void submit() {
    FocusScope.of(context).requestFocus(FocusNode());
    _formKey.currentState.save();
    onSubmit(category);
  }

  List<Widget> buildFormFields() {
    return <Widget>[
      TextFormField(
        autofocus: true,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintText: "Name",
          labelText: "Name",
          prefixIcon: Icon(Icons.title),
          border: OutlineInputBorder(),
        ),
        onFieldSubmitted: (value) => FocusScope.of(context).requestFocus(
          FocusNode(),
        ),
        onSaved: (value) => setState(
          () => category.name = value,
        ),
      ),
      UIHelper.verticalSpaceSmall,
      FormFieldDecorator(
        text: Text(
          (category?.parent == null) ? "Unknown" : category.parent.name,
        ),
        labelText: "Parent",
        prefixIcon: Icon(Icons.category),
        onTap: _selectCategory,
      ),
    ];
  }

  void _selectCategory() async {
    CategoryModel categorySelected =
        await AppRouter.navigateTo(context, CategorySelectionRoute());
    setState(() {
      category.parent = categorySelected;
    });
  }
}
