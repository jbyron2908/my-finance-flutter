import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/label/index.dart';
import 'package:my_finance_flutter/core/provider/repository/label/label_repository.dart';
import 'package:my_finance_flutter/ui/app/router/tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/create/widget/label_create_form.dart';

class LabelCreateView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var labelRepository = LabelRepository.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Create Label"),
      ),
      body: LabelCreateForm(onSubmit: (LabelModel label) async {
        await labelRepository.save(label);
        TabRouter.of(context).pop();
      }),
    );
  }
}
