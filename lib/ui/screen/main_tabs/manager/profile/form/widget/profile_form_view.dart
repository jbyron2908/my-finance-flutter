import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/form/widget/profile_form.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/profile/form/widget/profile_form_action_bar.dart';

class ProfileFormView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Profile"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ProfileForm(),
          ),
          ProfileFormActionBar()
        ],
      ),
    );
  }
}
