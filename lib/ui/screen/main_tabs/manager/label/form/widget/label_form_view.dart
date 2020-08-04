import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_finance_flutter/core/model/label/label_model.dart';
import 'package:my_finance_flutter/core/repository/label/label_repository.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/main_tab_router.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/form/widget/label_form.dart';

class LabelFormView extends StatelessWidget {
  final LabelRepository labelRepository = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Label'),
      ),
      body: LabelForm(onSubmit: (LabelModel label) async {
        await labelRepository.save(label);
        MainTabRouter.pop();
      }),
    );
  }
}
