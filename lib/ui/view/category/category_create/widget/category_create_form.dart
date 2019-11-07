import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_finance_flutter/core/provider/model/category_model.dart';
import 'package:my_finance_flutter/ui/app/app_router.dart';
import 'package:my_finance_flutter/ui/common/ui_helpers.dart';
import 'package:my_finance_flutter/ui/view/category/category_selection/screen/category_selection_route.dart';

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

  final TextEditingController _parentController = TextEditingController();

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
    _parentController.text =
        (category?.parent == null) ? "Unknown" : category.parent.name;

    return <Widget>[
      TextFormField(
        autofocus: true,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: "Name",
          labelText: "Name",
          prefixIcon: Icon(Icons.title),
          border: OutlineInputBorder(),
        ),
        onSaved: (value) => setState(
          () => category.name = value,
        ),
      ),
      UIHelper.verticalSpaceSmall,
      TextFormField(
        controller: _parentController,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: "Parent",
          labelText: "Parent",
          prefixIcon: Icon(Icons.category),
          border: OutlineInputBorder(),
        ),
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
