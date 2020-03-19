import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/screen.dart';
import 'package:my_finance_flutter/ui/view/tag/list/bloc/bloc.dart';
import 'package:my_finance_flutter/ui/view/tag/list/widget/view.dart';

class TagListScreen extends BaseScreen<TagListBloc> {
  @override
  Widget build(BuildContext context) {
    return TagListView();
  }

  @override
  TagListBloc buildBloc(BuildContext context) {
    return TagListBloc();
  }
}
