import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';

abstract class BaseBloc extends ChangeNotifier {
  List<SingleChildWidget> get dependencies;
}
