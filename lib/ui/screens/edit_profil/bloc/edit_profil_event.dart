part of 'edit_profil_bloc.dart';

abstract class EditProfilEvent extends Equatable {
  const EditProfilEvent();

  @override
  List<Object?> get props => [];
}

class EditProfilUpdateEvent extends EditProfilEvent {
  final String userName;

  EditProfilUpdateEvent(this.userName);

  @override
  List<Object?> get props => [userName];
}

class EditProfilTextChangedEvent extends EditProfilEvent {
  final String userName;

  EditProfilTextChangedEvent(this.userName);

  @override
  List<Object?> get props => [userName];
}

class DeleteAccountEvent extends EditProfilEvent {
  DeleteAccountEvent();

  @override
  List<Object?> get props => [];
}
