part of 'timer_bloc.dart';

abstract class TimerEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class StartCountdownEvent extends TimerEvent {}

class ResetTimerEvent extends TimerEvent {}
