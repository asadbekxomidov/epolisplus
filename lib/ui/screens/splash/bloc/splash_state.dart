part of 'splash_bloc.dart';

abstract class SplashState extends Equatable {
  @override
  List<Object?> get props => [];
}

class SplashInitial extends SplashState {}

class SplashInternetAvailableState extends SplashState {}

class SplashLoadingState extends SplashState {}

class SplashSuccessState extends SplashState {}

class SplashAuthRequiredState extends SplashState {}

class SplashNoInternetState extends SplashState {}
