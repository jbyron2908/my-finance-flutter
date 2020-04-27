import 'dart:convert';

import 'package:auto_data/auto_data.dart';
import 'package:meta/meta.dart';

part 'payee_model.g.dart';

@data
class $PayeeModel {
  @nullable
  int id;
  @nullable
  int remoteId;
  @nullable
  bool deleted;
  @nullable
  String name;
}
