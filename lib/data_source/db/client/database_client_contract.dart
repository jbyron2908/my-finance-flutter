import 'package:my_finance_flutter/data_source/db/model/post.dart';

abstract class DatabaseClient {
  Future<void> setup();
  PostBean getPostBean();
}
