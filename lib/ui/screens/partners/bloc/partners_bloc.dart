// // import 'package:epolisplus/log/logger.dart';
// import 'package:epolisplus/repository/partners/partners_repository.dart';
// import 'package:epolisplus/utils/errors.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:epolisplus/models/models_export.dart';
// part 'partners_event.dart';
// part 'partners_state.dart';

// class PartnersBloc extends Bloc<PartnersEvent, PartnersState> {
//   PartnersBloc() : super(PartnersSuccessState()) {
//     on<PartnersGetEvent>(partnersGet);
//   }

//   // Method to fetch partner data
//   Future<void> partnersGet(
//       PartnersGetEvent event, Emitter<PartnersState> emit) async {
//     print('partnersGet called');
//     emit(PartnersLoadingState());
//     try {
//       final partnersRepository = PartnersRepository();
//       print('Calling repository to fetch partners...'); // Debugging print

//       // Fetch the partners data from the repository
//       final partnersResponse = await partnersRepository.getPartners(
//         event.id!,
//         event.site!,
//         event.phone!,
//         event.image!,
//       );
//       print('Repository call complete.'); // Debugging print

//       if (partnersResponse.status == 200) {
//         print('Partners data fetched successfully.'); // Debugging print
//         emit(PartnersLoadedState(partners: partnersResponse.response!));
//       } else {
//         print(
//             'Error fetching partners: ${partnersResponse.message}'); // Debugging print
//         emit(PartnersErrorState(GetPartnersErrorclass()));
//       }
//     } catch (e) {
//       print('Error in fetching partners: $e'); // Debugging print
//       emit(PartnersErrorState(GetPartnersErrorclass()));
//     }
//   }
// }






import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:epolisplus/models/models_export.dart';
import 'package:epolisplus/repository/partners/partners_repository.dart';
import 'package:epolisplus/utils/errors.dart';

part 'partners_event.dart';
part 'partners_state.dart';

class PartnersBloc extends Bloc<PartnersEvent, PartnersState> {
  final PartnersRepository _partnersRepository;

  PartnersBloc() : _partnersRepository = PartnersRepository(), super(PartnersInitialState()) {
    on<PartnersGetEvent>(_onPartnersGetEvent);
  }

  Future<void> _onPartnersGetEvent(
      PartnersGetEvent event, Emitter<PartnersState> emit) async {
    emit(PartnersLoadingState());
    try {
      final response = await _partnersRepository.getPartners(
        event.id ?? 0,
        event.site ?? '',
        event.phone ?? '',
        event.image ?? '',
      );
      if (response.status == 200 && response.response != null) {
        emit(PartnersLoadedState(partners: response.response!));
      } else {
        emit(PartnersErrorState(GetPartnersErrorclass()));
      }
    } catch (error) {
      emit(PartnersErrorState(GetPartnersErrorclass()));
    }
  }
}
