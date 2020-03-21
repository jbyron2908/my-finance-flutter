import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/screen.dart';
import 'package:my_finance_flutter/ui/screen/label/list/bloc/bloc.dart';
import 'package:my_finance_flutter/ui/screen/label/list/widget/view.dart';

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
