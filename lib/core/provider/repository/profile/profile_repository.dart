import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';
import 'package:my_finance_flutter/core/provider/model/profile/profile_converter.dart';
import 'package:my_finance_flutter/core/provider/model/profile/profile_model.dart';
import 'package:provider/provider.dart';

class ProfileRepository {
  static SingleChildCloneableWidget buildProvider() =>
      ProxyProvider<DatabaseClient, ProfileRepository>(
        builder: (context, databaseClient, postRepository) =>
            ProfileRepository(databaseClient),
      );

  static ProfileRepository of(BuildContext context) =>
      Provider.of<ProfileRepository>(context);

  DatabaseClient _databaseClient;

  ProfileRepository(this._databaseClient) {
    _profileListStream = _databaseClient.profileDao.watchAll();
  }

  Stream<List<ProfileModel>> _profileListStream;
  Stream<List<ProfileModel>> get profileListStream => _profileListStream;

  Future<int> save(ProfileModel profile) async {
    return _databaseClient.profileDao.insert(
      ProfileConverter.toEntity(profile),
    );
  }
}
