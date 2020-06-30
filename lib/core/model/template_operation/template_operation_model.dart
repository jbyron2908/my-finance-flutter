import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_finance_flutter/core/model/category/category_model.dart';
import 'package:my_finance_flutter/core/model/operation/operation_model.dart';
import 'package:my_finance_flutter/core/model/payee/payee_model.dart';

part 'template_operation_model.freezed.dart';
part 'template_operation_model.g.dart';

@freezed
abstract class TemplateOperationModel
    with DiagnosticableTreeMixin
    implements _$TemplateOperationModel {
  const TemplateOperationModel._();

  const factory TemplateOperationModel({
    int id,
    int remoteId,
    bool deleted,
    String title,
    @Default(0) double value,
    OperationTypeModel type,
    OperationStateModel state,
    String description,
    PayeeModel payee,
    CategoryModel category,
  }) = _TemplateOperationModel;

  factory TemplateOperationModel.fromJson(Map<String, dynamic> json) =>
      _$TemplateOperationModelFromJson(json);
}
