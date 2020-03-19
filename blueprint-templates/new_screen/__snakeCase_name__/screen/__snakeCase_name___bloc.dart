import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/bloc/bloc.dart';
import 'package:provider/src/provider.dart';

class {{pascalCase name}}Bloc extends BaseBloc {
  static {{pascalCase name}}Bloc of(BuildContext context) =>
      Provider.of<{{pascalCase name}}Bloc>(context, listen: false);

  {{pascalCase name}}Bloc();

  @override
  List<SingleChildWidget> get dependencies => [];

}
