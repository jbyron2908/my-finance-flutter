import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/data_source/db/client/database_client.dart';
import 'package:my_finance_flutter/core/data_source/db/model/post.dart';
import 'package:provider/provider.dart';

class PostRepository {
  static PostRepository of(BuildContext context) =>
      Provider.of<PostRepository>(context);

  PostRepository(this._databaseClient);

  DatabaseClient _databaseClient;

  PostBean get _postBean {
    return _databaseClient.postBean;
  }

  Future<void> savePost(
      String msg, double stars, bool read, DateTime at) async {
    return _postBean.insert(Post.make(msg, stars, read, at));
  }

  Future<List<Post>> readAllPost() async {
    return await _postBean.getAll();
  }
}
