part of 'edit_profil_bloc.dart';

abstract class EditProfilEvent extends Equatable {
  const EditProfilEvent();

  @override
  List<Object?> get props => [];
}

class EditProfilUpdateEvent extends EditProfilEvent {
}

class DeleteAccountEvent extends EditProfilEvent {
  DeleteAccountEvent();

  @override
  List<Object?> get props => [];
}
