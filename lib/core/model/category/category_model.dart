import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
abstract class CategoryModel implements _$CategoryModel {
  const CategoryModel._();

  const factory CategoryModel({
    int id,
    int remoteId,
    bool deleted,
    String name,
    CategoryModel parent,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}
