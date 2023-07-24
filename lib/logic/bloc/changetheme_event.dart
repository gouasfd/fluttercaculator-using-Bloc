part of 'changetheme_bloc.dart';

@immutable
abstract class ChangethemeEvent {}

class changetheme extends ChangethemeEvent {
  final bool themestate;

  changetheme(this.themestate);
}
