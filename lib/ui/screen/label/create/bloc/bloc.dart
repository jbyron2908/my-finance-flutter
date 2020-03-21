import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/bloc/bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/src/provider.dart';

class LabelCreateBloc extends BaseBloc {
  static LabelCreateBloc of(BuildContext context) =>
      Provider.of<LabelCreateBloc>(context, listen: false);

  LabelCreateBloc();

  @override
  List<SingleChildWidget> get dependencies => [];
}
