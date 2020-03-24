import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/label/list/bloc/label_list_bloc.dart';
import 'package:my_finance_flutter/ui/screen/label/list/widget/label_list_view.dart';

class LabelListScreen extends BaseScreen<LabelListBloc> {
  @override
  Widget build(BuildContext context) {
    return LabelListView();
  }

  @override
  LabelListBloc buildBloc(BuildContext context) {
    return LabelListBloc();
  }
}
