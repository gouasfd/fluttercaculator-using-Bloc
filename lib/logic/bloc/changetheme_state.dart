part of 'changetheme_bloc.dart';

@immutable
abstract class ChangethemeState {}

class ChangethemeInitial extends ChangethemeState {}

class changethe extends ChangethemeState {
  final bool theme;

  changethe(this.theme);
}
