import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/base_screen.dart';
import 'package:my_finance_flutter/ui/view/tag/tag_list/screen/tag_list_bloc.dart';
import 'package:my_finance_flutter/ui/view/tag/tag_list/widget/tag_list_view.dart';

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
