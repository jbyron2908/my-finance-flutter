import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/view/profile/profile_create/widget/profile_create_form.dart';

class ProfileCreateView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Profile"),
      ),
      body: ProfileCreateForm(),
    );
  }
}
