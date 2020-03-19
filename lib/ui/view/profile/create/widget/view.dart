import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/view/profile/create/widget/form.dart';

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
