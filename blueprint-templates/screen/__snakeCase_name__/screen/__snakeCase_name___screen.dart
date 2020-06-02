import 'package:flutter/material.dart';
import 'package:my_finance_flutter/ui/common/base/screen/base_screen.dart';

class {{pascalCase name}}Screen extends BaseScreen<{{pascalCase name}}Bloc, {{pascalCase name}}RouteArgs> {
  @override
  Widget build(BuildContext context) {
    return {{pascalCase name}}View();
  }

  @override
  {{pascalCase name}}Bloc buildBloc(BuildContext context) {
    return {{pascalCase name}}Bloc(
      context: context,
    );
  }
}

