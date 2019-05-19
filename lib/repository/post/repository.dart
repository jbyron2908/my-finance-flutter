import 'package:meta/meta.dart';
import 'package:my_finance_flutter/data_source/db/model/post.dart';
import 'package:my_finance_flutter/repository/post/repository_contract.dart';

class MyFinancePostRepository implements PostRepository {
  PostBean _postBean;

  MyFinancePostRepository({@required PostBean postBean}) {
    _postBean = postBean;
  }
  
  @override
  Future<void> savePost(
      String msg, double stars, bool read, DateTime at) async {
    return await _postBean.insert(Post.make(msg, stars, read, at));
  }

  @override
  Future<List<Post>> readAllPost() async {
    return await _postBean.getAll();
  }
}
