import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/form/bloc/account_form_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/account/form/widget/account_form.dart';
import 'package:my_finance_flutter/ui/widgets/bottom_action_bar/bottom_action_bar.dart';

class AccountFormView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Account'),
      ),
      body: BottomActionBar(
        child: AccountForm(),
        actionList: [
          BottomActionItem(
            icon: Icons.cancel,
            onTap: () => AccountFormBloc.of(context).cancel(),
          ),
          BottomActionItem(
            icon: Icons.save,
            onTap: () => AccountFormBloc.of(context).submit(),
          ),
        ],
      ),
    );
  }
}
