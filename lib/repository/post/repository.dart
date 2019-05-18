import 'package:meta/meta.dart';
import 'package:my_finance_flutter/data_source/db/model/post.dart';

class PostRepository {
  PostBean _postBean;

  PostRepository({@required PostBean postBean}) {
    _postBean = postBean;
  }

  Future<void> savePost(
      String msg, double stars, bool read, DateTime at) async {
    return await _postBean.insert(Post.make(msg, stars, read, at));
  }

  Future<List<Post>> readAllPost() async {
    return await _postBean.getAll();
  }
}
