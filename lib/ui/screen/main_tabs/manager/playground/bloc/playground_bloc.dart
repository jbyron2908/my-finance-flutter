import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/bloc/base_bloc.dart';
import 'package:provider/src/provider.dart';
import 'package:provider/single_child_widget.dart';

class PlaygroundBloc extends BaseBloc {
  static PlaygroundBloc of(BuildContext context) =>
      Provider.of<PlaygroundBloc>(context, listen: false);

  final BuildContext context;

  PlaygroundBloc({
    @required this.context,
  });

  @override
  List<SingleChildWidget> get dependencies => [];

}
