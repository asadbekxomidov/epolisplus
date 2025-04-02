part of 'bloc.dart';

abstract class ProductEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductInfoEvent extends ProductEvent {}

class OpenCaskoBuyEvent extends ProductEvent {}
