import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/screen.dart';
import 'package:my_finance_flutter/ui/screen/label/create/bloc/bloc.dart';
import 'package:my_finance_flutter/ui/screen/label/create/widget/view.dart';

class LabelCreateScreen extends BaseScreen<LabelCreateBloc> {
  @override
  Widget build(BuildContext context) {
    return LabelCreateView();
  }

  @override
  LabelCreateBloc buildBloc(BuildContext context) {
    return LabelCreateBloc();
  }
}
