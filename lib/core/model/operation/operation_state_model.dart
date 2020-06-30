import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'operation_state_model.freezed.dart';
part 'operation_state_model.g.dart';

@freezed
abstract class OperationStateModel
    with DiagnosticableTreeMixin
    implements _$OperationStateModel {
  factory OperationStateModel({
    String id,
    String title,
  }) = _OperationStateModel;

  factory OperationStateModel.fromJson(Map<String, dynamic> json) =>
      _$OperationStateModelFromJson(json);
}
