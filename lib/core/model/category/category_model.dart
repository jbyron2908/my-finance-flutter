import 'dart:convert';

import 'package:auto_data/auto_data.dart';
import 'package:meta/meta.dart';

part 'category_model.g.dart';

@data
class $CategoryModel {
  @nullable
  int id;
  @nullable
  int remoteId;
  @nullable
  bool deleted;
  @nullable
  String name;
  @nullable
  $CategoryModel parent;
}
