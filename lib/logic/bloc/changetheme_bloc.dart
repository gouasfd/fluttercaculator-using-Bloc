import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'changetheme_event.dart';
part 'changetheme_state.dart';

class ChangethemeBloc extends Bloc<ChangethemeEvent, ChangethemeState> {
  ChangethemeBloc() : super(ChangethemeInitial()) {
    on<ChangethemeEvent>((event, emit) {
      // TODO: implement event handler
      if (event is changetheme) {
        switch (event.themestate) {
          case true:
            {
              emit(changethe(true));
            }
            break;
          default:
            {
              emit(changethe(false));
            }
        }
      }
    });
  }
}
