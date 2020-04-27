import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/form/bloc/label_form_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/form/widget/label_form_view.dart';
import 'package:provider/provider.dart';

class LabelFormScreen extends BaseScreen<LabelFormBloc, LabelFormScreenArgs> {
  @override
  Widget build(BuildContext context) {
    return LabelFormView();
  }

  @override
  LabelFormBloc buildBloc(BuildContext context) {
    return LabelFormBloc();
  }
}

class LabelFormScreenArgs {
  static LabelFormScreenArgs of(BuildContext context) =>
      Provider.of<LabelFormScreenArgs>(context, listen: false);

  int field1;

  LabelFormScreenArgs({
    this.field1,
  });
}
