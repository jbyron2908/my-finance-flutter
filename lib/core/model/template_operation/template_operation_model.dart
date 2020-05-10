import 'dart:convert';

import 'package:auto_data/auto_data.dart';
import 'package:meta/meta.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:my_finance_flutter/core/model/operation/operation_model.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';

export 'template_operation_model_extra.dart';

part 'template_operation_model.g.dart';

@data
class $TemplateOperationModel {
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
  $OperationStateModel state;
  @nullable
  String description;
  @nullable
  $PayeeModel payee;
  @nullable
  $CategoryModel category;
}
