import 'dart:convert';

import 'package:auto_data/auto_data.dart';
import 'package:meta/meta.dart';
import 'package:my_finance_flutter/core/model/account/index.dart';
import 'package:my_finance_flutter/core/model/category/index.dart';
import 'package:my_finance_flutter/core/model/operation/operation_state_model.dart';
import 'package:my_finance_flutter/core/model/operation/operation_type_model.dart';
import 'package:my_finance_flutter/core/model/payee/index.dart';
import 'package:my_finance_flutter/core/model/profile/index.dart';

part 'operation_model.g.dart';

@data
class $OperationModel {
  @nullable
  int id;
  @nullable
  int remoteId;
  @nullable
  bool deleted;
  @nullable
  String title;
  @nullable
  double value = 0;
  @nullable
  $OperationTypeModel type;
  @nullable
  DateTime date;
  @nullable
  $OperationStateModel state;
  @nullable
  String description;
  @nullable
  $PayeeModel payee;
  @nullable
  $CategoryModel category;
  @nullable
  $AccountModel account;
  @nullable
  $ProfileModel profile;
}
