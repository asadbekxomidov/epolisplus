part of 'splash_bloc.dart';

abstract class SplashEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckTokenEvent extends SplashEvent {}

class CheckConnectionEvent extends SplashEvent {}
