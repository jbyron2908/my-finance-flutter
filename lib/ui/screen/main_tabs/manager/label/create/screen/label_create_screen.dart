import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/create/bloc/label_create_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main_tabs/manager/label/create/widget/label_create_view.dart';

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
