import 'dart:convert';

import 'package:auto_data/auto_data.dart';
import 'package:meta/meta.dart';

export '{{snakeCase name}}_model_extra.dart';

part '{{snakeCase name}}_model.g.dart';

@data
class ${{pascalCase name}}Model {
  @nullable
  int id;
  @nullable
  int remoteId;
  @nullable
  bool deleted;
  @nullable
  String name;
}
