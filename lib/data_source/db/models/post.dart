// The model
import 'package:jaguar_orm/jaguar_orm.dart';

part 'post.jorm.dart';

class Post {
  Post();

  Post.make(this.msg, this.stars, this.read, this.at);

  @PrimaryKey(auto: true)
  int id;

  @Column(isNullable: true)
  String msg;

  @Column(isNullable: true)
  bool read;

  @Column(isNullable: true)
  double stars;

  @Column(isNullable: true)
  DateTime at;

  String toString() =>
      'Post(id: $id, message: $msg, stars: $stars, read: $read, at: $at)';
}

@GenBean()
class PostBean extends Bean<Post> with _PostBean {
  PostBean(Adapter adapter) : super(adapter);

  final String tableName = 'posts';
}
