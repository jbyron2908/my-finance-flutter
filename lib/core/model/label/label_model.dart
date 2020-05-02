import 'dart:convert';

import 'package:auto_data/auto_data.dart';
import 'package:meta/meta.dart';

export 'label_model_extra.dart';

part 'label_model.g.dart';

@data
class $LabelModel {
  @nullable
  int id;
  @nullable
  int remoteId;
  @nullable
  bool deleted;
  @nullable
  String name;
}
