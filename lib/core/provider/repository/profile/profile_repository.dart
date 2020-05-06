import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';
import 'package:my_finance_flutter/core/model/profile/profile_converter.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProfileRepository {
  static SingleChildWidget buildProvider() =>
      ProxyProvider<DatabaseClient, ProfileRepository>(
        update: (context, databaseClient, profileRepository) =>
            ProfileRepository(databaseClient),
      );

  static ProfileRepository of(BuildContext context) =>
      Provider.of<ProfileRepository>(context, listen: false);

  final DatabaseClient _databaseClient;

  ProfileRepository(this._databaseClient) {
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
}
