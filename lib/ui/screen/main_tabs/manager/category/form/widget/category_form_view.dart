import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/form/bloc/category_form_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/category/form/widget/category_form.dart';
import 'package:my_finance_flutter/ui/widgets/bottom_action_bar/bottom_action_bar.dart';

class CategoryFormView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Category"),
      ),
      body: BottomActionBar(
        child: CategoryForm(),
        actionList: [
          BottomActionItem(
            icon: Icons.cancel,
            onTap: () => CategoryFormBloc.of(context).cancel(),
          ),
          BottomActionItem(
            icon: Icons.save,
            onTap: () => CategoryFormBloc.of(context).submit(),
          ),
        ],
      ),
    );
  }
}
