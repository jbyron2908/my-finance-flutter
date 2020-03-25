import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';
import 'package:my_finance_flutter/core/model/profile/index.dart';
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