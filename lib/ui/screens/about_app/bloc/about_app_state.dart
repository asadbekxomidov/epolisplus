part of 'about_app_bloc.dart';

abstract class AboutAppState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AboutAppInitialState extends AboutAppState {}

class AboutAppLoadingState extends AboutAppState {}

class AboutAppLoadedState extends AboutAppState {}

class AboutAppErrorState extends AboutAppState {}
