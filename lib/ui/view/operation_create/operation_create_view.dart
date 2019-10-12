import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/provider/model/operation_model.dart';
import 'package:my_finance_flutter/core/provider/repository/operation/operation_repository.dart';
import 'package:my_finance_flutter/ui/view/operation_create/operation_create_form.dart';

class OperationCreateView extends StatelessWidget {
  OperationCreateView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var operationRepository = OperationRepository.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Create Operation"),
      ),
      body: OperationCreateForm(onSubmit: (OperationModel operation) async {
        await operationRepository.save(operation);
        Navigator.of(context).pop();
      }),
    );
  }
}
