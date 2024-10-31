import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc() : super(TimerRunningState(60)) {
    on<StartCountdownEvent>((event, emit) async {
      await _startTimer(emit);
    });

    on<ResetTimerEvent>((event, emit) {
      emit(TimerRunningState(60));
      add(StartCountdownEvent());
    });
  }

  Future<void> _startTimer(Emitter<TimerState> emit) async {
    int seconds = 60;
    while (seconds > 0) {
      await Future.delayed(Duration(seconds: 1));
      seconds--;
      emit(TimerRunningState(seconds));
    }
    emit(TimerCompletedState());
  }
}
