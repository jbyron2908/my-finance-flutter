import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/base_bloc.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/src/provider.dart';

class TagListBloc extends BaseBloc {
  static TagListBloc of(BuildContext context) =>
      Provider.of<TagListBloc>(context, listen: false);

  TagListBloc();

  @override
  List<SingleChildWidget> get dependencies => [];
}
