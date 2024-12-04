part of 'oferta_bloc.dart';

abstract class OfertaEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class OfertaGetEvent extends OfertaEvent {}

class OfertaPartnersGetEvent extends OfertaEvent {}
