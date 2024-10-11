import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'timer_event.dart';
part 'timer_state.dart';

// class TimerBloc extends Bloc<TimerEvent, TimerState> {
//   TimerBloc() : super(TimerRunningState(60)) {
//     on<StartCountdownEvent>(_startCountdown);
//     on<ResetTimerEvent>(_resetTimer);
//   }

//   void _startCountdown(StartCountdownEvent event, Emitter<TimerState> emit) async {
//     int secondsRemaining = (state is TimerRunningState)
//         ? (state as TimerRunningState).secondsRemaining
//         : 60;

//     while (secondsRemaining > 0) {
//       await Future.delayed(Duration(seconds: 1));
//       secondsRemaining--;
//       emit(TimerRunningState(secondsRemaining));
//     }
//     emit(TimerCompletedState());
//   }

//   void _resetTimer(ResetTimerEvent event, Emitter<TimerState> emit) {
//     emit(TimerRunningState(60));
//     add(StartCountdownEvent());
//   }
// }

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc() : super(TimerRunningState(60)) {
    on<StartCountdownEvent>((event, emit) async {
      await _startTimer(emit);
    });

    on<ResetTimerEvent>((event, emit) {
      emit(TimerRunningState(60));
      add(StartCountdownEvent()); // Restart the countdown
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
