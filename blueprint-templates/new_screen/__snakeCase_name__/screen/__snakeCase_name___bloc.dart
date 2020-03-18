import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/base_bloc.dart';
import 'package:provider/src/provider.dart';

class {{pascalCase name}}Bloc extends BaseBloc {
  static {{pascalCase name}}Bloc of(BuildContext context) =>
      Provider.of<{{pascalCase name}}Bloc>(context);

  {{pascalCase name}}Bloc();

  @override
  List<SingleChildWidget> get dependencies => [];

}
