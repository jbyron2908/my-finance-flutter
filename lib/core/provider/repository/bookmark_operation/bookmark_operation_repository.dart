import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/data_source/database/client/database_client.dart';
import 'package:my_finance_flutter/core/model/bookmark_operation/bookmark_operation_converter.dart';
import 'package:my_finance_flutter/core/model/bookmark_operation/bookmark_operation_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class BookmarkOperationRepository {
  static SingleChildWidget buildProvider() =>
      ProxyProvider<DatabaseClient, BookmarkOperationRepository>(
        update: (context, databaseClient, repository) =>
            BookmarkOperationRepository(databaseClient),
      );

  static BookmarkOperationRepository of(BuildContext context) =>
      Provider.of<BookmarkOperationRepository>(context, listen: false);

  final DatabaseClient _databaseClient;

  BookmarkOperationRepository(this._databaseClient) {
    _bookmarkOperationListStream =
        _databaseClient.bookmarkOperationDao.watchAll();
  }

  Stream<List<BookmarkOperationModel>> _bookmarkOperationListStream;
  Stream<List<BookmarkOperationModel>> get bookmarkOperationListStream =>
      _bookmarkOperationListStream;

  Future<int> save(BookmarkOperationModel bookmarkOperation) async {
    return _databaseClient.bookmarkOperationDao.insert(
      BookmarkOperationConverter.toEntity(bookmarkOperation),
    );
  }
}
