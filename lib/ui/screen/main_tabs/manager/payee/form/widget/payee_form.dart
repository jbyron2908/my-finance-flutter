import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/form/controller/payee_form_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/form/controller/payee_form_view_model.dart';

class PayeeForm extends StatelessWidget {
  final PayeeFormController controller = Get.find();
  final PayeeFormViewModel viewModel = Get.find();

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
        initialValue: viewModel.payee.name,
        validator: RequiredValidator(errorText: 'Required'),
        onFieldSubmitted: (value) {
          if (value != null) {
            viewModel.updatePayee(name: value);
          }
        },
        onSaved: (value) {
          if (value != null) {
            viewModel.updatePayee(name: value);
          }
        },
      ),
    ];
  }
}
