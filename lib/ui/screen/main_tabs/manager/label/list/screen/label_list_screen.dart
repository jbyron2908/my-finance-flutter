import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/list/bloc/label_list_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/list/widget/label_list_view.dart';
import 'package:provider/provider.dart';

class LabelListScreen extends BaseScreen<LabelListBloc, LabelListScreenArgs> {
  @override
  Widget build(BuildContext context) {
    return LabelListView();
  }

  @override
  LabelListBloc buildBloc(BuildContext context) {
    return LabelListBloc();
  }
}

class LabelListScreenArgs {
  static LabelListScreenArgs of(BuildContext context) =>
      Provider.of<LabelListScreenArgs>(context, listen: false);

  int field1;

  LabelListScreenArgs({
    this.field1,
  });
}
