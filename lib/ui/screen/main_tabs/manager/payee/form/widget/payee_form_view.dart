import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/payee/index.dart';
import 'package:my_finance_flutter/core/provider/repository/payee/payee_repository.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/form/widget/payee_form.dart';

class PayeeFormView extends StatelessWidget {
  PayeeFormView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var payeeRepository = PayeeRepository.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Create Payee"),
      ),
      body: PayeeForm(onSubmit: (PayeeModel payee) async {
        await payeeRepository.save(payee);
        Navigator.of(context).pop();
      }),
    );
  }
}
