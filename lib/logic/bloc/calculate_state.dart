part of 'calculate_bloc.dart';

@immutable
abstract class CalculateState {}

class CalculateInitial extends CalculateState {}

class number extends CalculateState {
  final num;

  number(this.num);
}

class operation extends CalculateState {
  final op;

  operation(this.op);
}

class number2 extends CalculateState {
  final num;

  number2(this.num);
}

class result_state extends CalculateState {
  final reso;

  result_state(this.reso);
}

class clear extends CalculateState {
  final clears;

  clear(this.clears);
}
