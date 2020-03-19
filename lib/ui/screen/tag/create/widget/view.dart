import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/tag/model.dart';
import 'package:my_finance_flutter/core/provider/repository/tag/repository.dart';
import 'package:my_finance_flutter/ui/app/router/app_router.dart';
import 'package:my_finance_flutter/ui/screen/tag/create/widget/form.dart';

class TagCreateView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var tagRepository = TagRepository.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Create Tag"),
      ),
      body: TagCreateForm(onSubmit: (TagModel tag) async {
        await tagRepository.save(tag);
        AppRouter.pop(context);
      }),
    );
  }
}
