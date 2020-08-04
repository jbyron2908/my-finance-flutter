import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/ui/common/ui_helpers.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/form/controller/profile_form_controller.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/form/controller/profile_form_view_model.dart';

class ProfileForm extends StatefulWidget {
  @override
  ProfileFormState createState() => ProfileFormState();
}

class ProfileFormState extends State<ProfileForm> {
  final FocusNode _currencyNode = FocusNode();

  final ProfileFormController controller = Get.find();
  final ProfileFormViewModel viewModel = Get.find();

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
        textInputAction: TextInputAction.next,
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
            _currencyNode.requestFocus();
          }
        },
        onSaved: (value) {
          if (value != null) {
            viewModel.name.value = value;
          }
        },
      ),
      UIHelper.verticalSpaceSmall,
      TextFormField(
        focusNode: _currencyNode,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintText: 'Currency',
          labelText: 'Currency',
          prefixIcon: Icon(Icons.monetization_on),
          border: OutlineInputBorder(),
        ),
        initialValue: viewModel.currency.value,
        validator: RequiredValidator(errorText: 'Required'),
        onFieldSubmitted: (value) {
          if (value != null) {
            viewModel.currency.value = value;
            FocusScope.of(context).requestFocus(FocusNode());
          }
        },
        onSaved: (value) {
          if (value != null) {
            viewModel.currency.value = value;
          }
        },
      )
    ];
  }
}
