// part of 'edit_profil_bloc.dart';

// abstract class EditProfilState extends Equatable {
//   @override
//   List<Object?> get props => [];
// }

// class EditProfileInitialState extends EditProfilState {}

// class EditProfileLoadingState extends EditProfilState {}

// class EditProfileLoadedState extends EditProfilState {}

// class EditProfileErrorState extends EditProfilState {}

// class EditProfileSuccesState extends EditProfilState {}

part of 'edit_profil_bloc.dart';

abstract class EditProfilState extends Equatable {
  const EditProfilState();

  @override
  List<Object?> get props => [];
}

class EditProfileInitialState extends EditProfilState {}

class EditProfileLoadingState extends EditProfilState {}

class EditProfileErrorState extends EditProfilState {}

class EditProfilTextChangedState extends EditProfilState {
  final String userName;

  EditProfilTextChangedState(this.userName);

  @override
  List<Object?> get props => [userName];
}
