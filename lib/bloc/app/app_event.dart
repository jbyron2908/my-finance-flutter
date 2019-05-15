import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class AppEvent extends Equatable {
  AppEvent([List props = const []]) : super(props);
}

class AppStartedEvent extends AppEvent {
  @override
  String toString() => 'AppStarted';
}