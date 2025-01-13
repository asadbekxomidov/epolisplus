part of 'edit_profil_bloc.dart';

abstract class EditProfilState extends Equatable {
  const EditProfilState();

  @override
  List<Object?> get props => [];
}

class EditProfileInitialState extends EditProfilState {}

class EditProfileLoadingState extends EditProfilState {}

class EditProfileErrorState extends EditProfilState {
  Failure failure;

  EditProfileErrorState(this.failure);
}

class EditProfilTextChangedState extends EditProfilState {
  final String userName;

  EditProfilTextChangedState(this.userName);

  @override
  List<Object?> get props => [userName];
}
