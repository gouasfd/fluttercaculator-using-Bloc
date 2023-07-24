import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'calculate_event.dart';
part 'calculate_state.dart';

class CalculateBloc extends Bloc<CalculateEvent, CalculateState> {
  CalculateBloc() : super(CalculateInitial()) {
    on<CalculateEvent>((event, emit) {
      // TODO: implement event handler
      if (event is numbers) {
        emit(number(event.number));
      } else if (event is clear_event)
        emit(clear(0));
      else if (event is oprationevent) {
        emit(operation(event.op));
      } else if (event is numbers2) {
        emit(number2(event.number));
      } else if (event is result) {
        //here is the problem
        switch (event.opration) {
          case '+':
            {
              emit(result_state(event.input1 + event.input2));
            }
            break;
          case '-':
            {
              emit(result_state(event.input1 - event.input2));
            }
            break;
          case 'X':
            {
              emit(result_state(event.input1 * event.input2));
            }
            break;
          case '/':
            {
              emit(result_state(event.input1 / event.input2));
            }
            break;
          default:
            {
              emit(result_state(event.input1 % event.input2));
            }
        }
      }
    });
  }
}
