part of 'partners_bloc.dart';

abstract class PartnersState extends Equatable {
  @override
  List<Object> get props => [];
}

// Boshlang'ich holat
class PartnersInitialState extends PartnersState {}

// Yuklanayotgan holat
class PartnersLoadingState extends PartnersState {}

// Muvaffaqiyatli partnerlar olinganda holat
class PartnersLoadedState extends PartnersState {
  List<PartnersResponse> partners;

  PartnersLoadedState({required this.partners});

  @override
  List<Object> get props => [partners];
}

// Xatolik holati
class PartnersErrorState extends PartnersState {
  Failure failure;

  PartnersErrorState(this.failure);
}

class PartnersSuccessState extends PartnersState {}
