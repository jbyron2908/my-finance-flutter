import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/bloc/base_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/src/provider.dart';

class LabelFormBloc extends BaseBloc {
  static LabelFormBloc of(BuildContext context) =>
      Provider.of<LabelFormBloc>(context, listen: false);

  LabelFormBloc();

  @override
  List<SingleChildWidget> get dependencies => [];
}
