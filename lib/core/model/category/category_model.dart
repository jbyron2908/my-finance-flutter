import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_finance_flutter/core/model/icon/icon_model.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
abstract class CategoryModel
    with DiagnosticableTreeMixin
    implements _$CategoryModel {
  const CategoryModel._();

  const factory CategoryModel({
    int id,
    int remoteId,
    bool deleted,
    String name,
    IconModel icon,
    CategoryModel parent,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  static CategoryModel buildEmpty() {
    return CategoryModel(
      icon: IconModel.iconDefault,
    );
  }
}
