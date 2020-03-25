import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/payee/index.dart';
import 'package:my_finance_flutter/core/provider/repository/payee/payee_repository.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/create/widget/payee_create_form.dart';

class PayeeCreateView extends StatelessWidget {
  PayeeCreateView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var payeeRepository = PayeeRepository.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Create Payee"),
      ),
      body: PayeeCreateForm(onSubmit: (PayeeModel payee) async {
        await payeeRepository.save(payee);
        Navigator.of(context).pop();
      }),
    );
  }
}