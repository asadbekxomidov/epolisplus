part of 'timer_bloc.dart';

abstract class TimerState extends Equatable {
  @override
  List<Object> get props => [];
}

class TimerRunningState extends TimerState {
  final int secondsRemaining;

  TimerRunningState(this.secondsRemaining);

  @override
  List<Object> get props => [secondsRemaining];
}

class TimerCompletedState extends TimerState {}
