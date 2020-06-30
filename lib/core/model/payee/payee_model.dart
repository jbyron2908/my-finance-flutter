import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payee_model.freezed.dart';
part 'payee_model.g.dart';

@freezed
abstract class PayeeModel with DiagnosticableTreeMixin implements _$PayeeModel {
  const PayeeModel._();

  const factory PayeeModel({
    int id,
    int remoteId,
    bool deleted,
    String name,
  }) = _PayeeModel;

  factory PayeeModel.fromJson(Map<String, dynamic> json) =>
      _$PayeeModelFromJson(json);
}
