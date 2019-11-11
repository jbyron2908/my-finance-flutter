import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/base_screen.dart';
import 'package:my_finance_flutter/ui/view/tag/tag_create/screen/tag_create_bloc.dart';
import 'package:my_finance_flutter/ui/view/tag/tag_create/widget/tag_create_view.dart';

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
