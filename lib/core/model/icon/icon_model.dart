import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'icon_model.freezed.dart';
part 'icon_model.g.dart';

@freezed
abstract class IconModel with DiagnosticableTreeMixin implements _$IconModel {
  const IconModel._();

  const factory IconModel({
    int cicleColor,
    int iconCodePoint,
    String iconFontFamily,
    String iconFontPackage,
  }) = _IconModel;

  factory IconModel.fromJson(Map<String, dynamic> json) =>
      _$IconModelFromJson(json);
}
