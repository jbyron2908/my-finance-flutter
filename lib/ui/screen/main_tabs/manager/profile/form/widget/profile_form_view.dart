import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/form/bloc/profile_form_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/form/widget/profile_form.dart';
import 'package:my_finance_flutter/ui/widgets/bottom_action_bar/bottom_action_bar.dart';

class ProfileFormView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Profile'),
      ),
      body: BottomActionBar(
        child: ProfileForm(),
        actionList: [
          BottomActionItem(
            icon: Icons.cancel,
            onTap: () => ProfileFormBloc.of(context).cancel(),
          ),
          BottomActionItem(
            icon: Icons.save,
            onTap: () => ProfileFormBloc.of(context).submit(),
          ),
        ],
      ),
    );
  }
}
