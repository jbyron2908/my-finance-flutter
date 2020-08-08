import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:my_finance_flutter/ui/common/ui_helpers.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/form/controller/category_form_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/form/controller/category_form_view_model.dart';
import 'package:my_finance_flutter/ui/widgets/form/custom_form_field.dart';

class CategoryForm extends StatelessWidget {
  final FocusNode _parentNode = FocusNode();

  final CategoryFormViewModel viewModel = Get.find();
  final CategoryFormController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onPanDown: (_) {
        // Hide keyboard when scroll
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Form(
        key: controller.formKey,
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: <Widget>[
            ...buildFormFields(),
          ],
        ),
      ),
    );
  }

  List<Widget> buildFormFields() {
    return <Widget>[
      TextFormField(
        autofocus: true,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintText: 'Name',
          labelText: 'Name',
          prefixIcon: Icon(Icons.description),
          border: OutlineInputBorder(),
        ),
        initialValue: viewModel.name.value,
        validator: RequiredValidator(errorText: 'Required'),
        onFieldSubmitted: (value) {
          if (value != null) {
            viewModel.name.value = value;
            _parentNode.requestFocus();
          }
        },
        onSaved: (value) {
          if (value != null) {
            viewModel.name.value = value;
          }
        },
      ),
      UIHelper.verticalSpaceSmall,
      CustomFormField<CategoryModel>(
        labelText: 'Parent',
        focusNode: _parentNode,
        prefixIcon: Icon(Icons.category),
        initialValue: viewModel.parent.value,
        enabled: !(viewModel.argument.category.id != null &&
            viewModel.argument.category.parent == null),
        buildText: (value) => (value == null) ? 'No parent' : value.name,
        onFieldSubmitted: (value) {
          if (value != null) {
            viewModel.parent.value = value;
          }
        },
        onSaved: (value) {
          if (value != null) {
            viewModel.parent.value = value;
          }
        },
        onTapOrFocus: () => controller.selectCategory(),
      ),
    ];
  }
}
