import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/label/label_model.dart';
import 'package:my_finance_flutter/core/provider/repository/label/repository.dart';
import 'package:my_finance_flutter/ui/app/router/app_router.dart';
import 'package:my_finance_flutter/ui/screen/label/create/widget/form.dart';

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
        AppRouter.pop(context);
      }),
    );
  }
}
