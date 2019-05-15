import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AppState extends Equatable {}

class AppInitState extends AppState {
  @override
  String toString() => 'AppInitState';
}

class AppStartedState extends AppState {
  @override
  String toString() => 'AppStartedState';
}

class AppReadyState extends AppState {
  @override
  String toString() => 'AppReadyState';
}