import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';
import 'package:my_finance_flutter/core/provider/model/tag_model.dart';
import 'package:provider/provider.dart';

class TagRepository {
  static SingleChildCloneableWidget buildProvider() =>
      ProxyProvider<DatabaseClient, TagRepository>(
        builder: (context, databaseClient, postRepository) =>
            TagRepository(databaseClient),
      );

  static TagRepository of(BuildContext context) =>
      Provider.of<TagRepository>(context);

  TagRepository(this._databaseClient) {
    _tagListStream = _databaseClient.tagDao.watchAll();
  }

  DatabaseClient _databaseClient;

  Stream<List<TagModel>> _tagListStream;
  Stream<List<TagModel>> get tagListStream => _tagListStream;

  Future<int> save(TagModel model) async {
    return _databaseClient.tagDao.insert(
      TagConverter.toEntity(model),
    );
  }
}
