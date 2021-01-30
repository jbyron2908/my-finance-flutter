import 'package:get/get.dart';
import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';
import 'package:my_finance_flutter/core/model/profile/profile_converter.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';

class ProfileRepository {
  final DatabaseClient _databaseClient = Get.find();

  ProfileRepository() {
    _profileListStream = _databaseClient.profileDao.watchAll();
  }

  Stream<List<ProfileModel>> _profileListStream;
  Stream<List<ProfileModel>> get profileListStream => _profileListStream;

  Future save(ProfileModel profile) async {
    return _databaseClient.profileDao.save(
      ProfileConverter.toEntity(profile),
    );
  }

  Future delete(ProfileModel profile) async {
    return _databaseClient.profileDao
        .markDelete(ProfileConverter.toEntity(profile));
  }

  Future clearAll() {
    return _databaseClient.profileDao.clearAll();
  }
}
