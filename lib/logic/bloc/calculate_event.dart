part of 'calculate_bloc.dart';

@immutable
abstract class CalculateEvent {}

class calc extends CalculateEvent {
  final int input1;
  final int input2;
  final String operation;

  calc(this.input1, this.input2, this.operation);
}

class numbers extends CalculateEvent {
  final int number;

  numbers(this.number);
}

class oprationevent extends CalculateEvent {
  final String op;

  oprationevent(this.op);
}

class numbers2 extends CalculateEvent {
  final int number;

  numbers2(this.number);
}

class result extends CalculateEvent {
  final int input1;
  final int input2;
  final String opration;

  result(this.input1, this.input2, this.opration);
}

class clear_event extends CalculateEvent {}
