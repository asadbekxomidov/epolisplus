part of 'partners_bloc.dart';

abstract class PartnersEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PartnersGetEvent extends PartnersEvent {
  final int? id;
  final String? site;
  final String? phone;
  final String? image;

  PartnersGetEvent({this.id, this.site, this.phone, this.image});

  @override
  List<Object?> get props => [id, site, phone, image];
}

class PartnerPushWebEvent extends PartnersEvent {
  final String url;

  PartnerPushWebEvent(this.url);
}

class PartnerPushPhoneEvent extends PartnersEvent {
  final String phone;

  PartnerPushPhoneEvent(this.phone);
}
