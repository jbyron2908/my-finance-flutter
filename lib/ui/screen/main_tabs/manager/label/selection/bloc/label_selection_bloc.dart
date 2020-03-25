import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/bloc/base_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/src/provider.dart';

class LabelSelectionBloc extends BaseBloc {
  static LabelSelectionBloc of(BuildContext context) =>
      Provider.of<LabelSelectionBloc>(context, listen: false);

  LabelSelectionBloc();

  @override
  List<SingleChildWidget> get dependencies => [];
}
