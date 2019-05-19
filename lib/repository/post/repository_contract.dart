import 'package:my_finance_flutter/data_source/db/model/post.dart';

abstract class PostRepository {
  Future<void> savePost(String msg, double stars, bool read, DateTime at);
  Future<List<Post>> readAllPost();
}
