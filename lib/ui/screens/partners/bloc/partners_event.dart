part of 'partners_bloc.dart';

abstract class PartnersEvent extends Equatable {
  const PartnersEvent();

  @override
  List<Object> get props => [];
}

// Partnerlar olish uchun event
class PartnersGetEvent extends PartnersEvent {
  final int? id;
  final String? site;
  final String? phone;
  final String? image;

  const PartnersGetEvent({
     this.id,
     this.site,
     this.phone,
     this.image,
  });

  @override
  List<Object> get props => [id!, site!, phone!, image!];
}
