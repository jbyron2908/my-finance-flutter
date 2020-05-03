import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/form/bloc/payee_form_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/payee/form/widget/payee_form.dart';
import 'package:my_finance_flutter/ui/widgets/bottom_action_bar/bottom_action_bar.dart';

class PayeeFormView extends StatelessWidget {
  PayeeFormView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Payee"),
      ),
      body: BottomActionBar(
        child: PayeeForm(),
        actionList: [
          BottomActionItem(
            icon: Icons.cancel,
            onTap: () => PayeeFormBloc.of(context).cancel(),
          ),
          BottomActionItem(
            icon: Icons.save,
            onTap: () => PayeeFormBloc.of(context).submit(),
          ),
        ],
      ),
    );
  }
}
