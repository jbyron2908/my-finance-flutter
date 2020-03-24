import 'dart:convert';

import 'package:auto_data/auto_data.dart';
import 'package:meta/meta.dart';

part 'profile_model.g.dart';

@data
class $ProfileModel {
  @nullable
  int id;
  @nullable
  int remoteId;
  @nullable
  String name;
  @nullable
  String currency;
}
