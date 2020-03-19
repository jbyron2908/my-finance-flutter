import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/bloc/bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/src/provider.dart';

class TagSelectionBloc extends BaseBloc {
  static TagSelectionBloc of(BuildContext context) =>
      Provider.of<TagSelectionBloc>(context, listen: false);

  TagSelectionBloc();

  @override
  List<SingleChildWidget> get dependencies => [];
}
