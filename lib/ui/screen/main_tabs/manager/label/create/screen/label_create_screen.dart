import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/create/bloc/label_create_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/create/widget/label_create_view.dart';
import 'package:provider/provider.dart';

class LabelCreateScreen
    extends BaseScreen<LabelCreateBloc, LabelCreateScreenArgs> {
  @override
  Widget build(BuildContext context) {
    return LabelCreateView();
  }

  @override
  LabelCreateBloc buildBloc(BuildContext context) {
    return LabelCreateBloc();
  }
}

class LabelCreateScreenArgs {
  static LabelCreateScreenArgs of(BuildContext context) =>
      Provider.of<LabelCreateScreenArgs>(context, listen: false);

  int field1;

  LabelCreateScreenArgs({
    this.field1,
  });
}
