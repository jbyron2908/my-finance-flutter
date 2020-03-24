import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/bloc/base_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/src/provider.dart';

class LabelListBloc extends BaseBloc {
  static LabelListBloc of(BuildContext context) =>
      Provider.of<LabelListBloc>(context, listen: false);

  LabelListBloc();

  @override
  List<SingleChildWidget> get dependencies => [];
}
