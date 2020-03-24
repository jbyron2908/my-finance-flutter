import 'dart:convert';

import 'package:auto_data/auto_data.dart';
import 'package:meta/meta.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';

part 'account_model.g.dart';

@data
class $AccountModel {
  @nullable
  int id;
  @nullable
  int remoteId;
  @nullable
  String name;
  @nullable
  String type;
  @nullable
  double initialValue;
  @nullable
  ProfileModel profile;
}
