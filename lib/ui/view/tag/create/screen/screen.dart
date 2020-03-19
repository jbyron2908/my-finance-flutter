import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/screen.dart';
import 'package:my_finance_flutter/ui/view/tag/create/bloc/bloc.dart';
import 'package:my_finance_flutter/ui/view/tag/create/widget/view.dart';

class TagCreateScreen extends BaseScreen<TagCreateBloc> {
  @override
  Widget build(BuildContext context) {
    return TagCreateView();
  }

  @override
  TagCreateBloc buildBloc(BuildContext context) {
    return TagCreateBloc();
  }
}
