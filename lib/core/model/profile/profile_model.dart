import 'dart:convert';

import 'package:auto_data/auto_data.dart';
import 'package:meta/meta.dart';

export 'profile_model_extra.dart';

part 'profile_model.g.dart';

@data
class $ProfileModel {
  @nullable
  int id;
  @nullable
  int remoteId;
  @nullable
  bool deleted;
  @nullable
  String name;
  @nullable
  String currency;
}
