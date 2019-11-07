import 'package:provider/provider.dart';

abstract class BaseBloc {
  List<SingleChildCloneableWidget> get dependencies;
}
