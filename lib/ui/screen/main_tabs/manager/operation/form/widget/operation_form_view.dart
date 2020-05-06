import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/form/bloc/operation_form_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/operation/form/widget/operation_form.dart';
import 'package:my_finance_flutter/ui/widgets/bottom_action_bar/bottom_action_bar.dart';

class OperationFormView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Operation'),
      ),
      body: BottomActionBar(
        child: OperationForm(),
        actionList: [
          BottomActionItem(
            icon: Icons.cancel,
            onTap: () => OperationFormBloc.of(context).cancel(),
          ),
          BottomActionItem(
            icon: Icons.save,
            onTap: () => OperationFormBloc.of(context).submit(),
          ),
        ],
      ),
    );
  }
}
