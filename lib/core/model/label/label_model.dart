import 'package:freezed_annotation/freezed_annotation.dart';

part 'label_model.freezed.dart';
part 'label_model.g.dart';

@freezed
abstract class LabelModel implements _$LabelModel {
  const LabelModel._();

  const factory LabelModel({
    int id,
    int remoteId,
    bool deleted,
    String name,
  }) = _LabelModel;

  factory LabelModel.fromJson(Map<String, dynamic> json) =>
      _$LabelModelFromJson(json);
}
