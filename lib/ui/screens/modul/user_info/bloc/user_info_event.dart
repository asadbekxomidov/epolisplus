part of 'user_info_bloc.dart';

abstract class UserInfoEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class UserInfoGetEvent extends UserInfoEvent {}

class UserBirhDateEvent extends UserInfoEvent {}

