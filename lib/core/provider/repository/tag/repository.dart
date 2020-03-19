import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/data_source/database/client/client.dart';
import 'package:my_finance_flutter/core/model/tag/converter.dart';
import 'package:my_finance_flutter/core/model/tag/model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class TagRepository {
  static SingleChildWidget buildProvider() =>
      ProxyProvider<DatabaseClient, TagRepository>(
        update: (context, databaseClient, tagRepository) =>
            TagRepository(databaseClient),
      );

  static TagRepository of(BuildContext context) =>
      Provider.of<TagRepository>(context, listen: false);

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
