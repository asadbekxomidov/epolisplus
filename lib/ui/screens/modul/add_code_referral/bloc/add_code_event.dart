part of 'add_code_bloc.dart';

abstract class AddCodeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OpenInputPolEvent extends AddCodeEvent {}

class CheckInputPolEvent extends AddCodeEvent {}

class RefCodeGetState extends AddCodeEvent {}
