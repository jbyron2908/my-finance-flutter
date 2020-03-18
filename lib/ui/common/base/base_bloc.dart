import 'package:provider/single_child_widget.dart';

abstract class BaseBloc {
  List<SingleChildWidget> get dependencies;
}
