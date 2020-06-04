import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
abstract class ProfileModel implements _$ProfileModel {
  const ProfileModel._();

  const factory ProfileModel({
    int id,
    int remoteId,
    bool deleted,
    String name,
    String currency,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}
