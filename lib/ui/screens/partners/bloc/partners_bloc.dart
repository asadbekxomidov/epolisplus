import 'package:epolisplus/log/logger.dart';
import 'package:epolisplus/repository/partners/partners_repository.dart';
import 'package:epolisplus/utils/errors.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/models/models_export.dart';
part 'partners_event.dart';
part 'partners_state.dart';

// class PartnersBloc extends Bloc<PartnersEvent, PartnersState> {
//   PartnersBloc() : super(PartnersSuccessState()) {
//     on<PartnersGetEvent>(partnersGet);
//   }

//   // Ma'lumotlarni olish uchun metod
//   Future<void> partnersGet(
//       PartnersGetEvent event, Emitter<PartnersState> emit) async {
//     emit(PartnersLoadingState());
//     try {
//       final partnersRepository = PartnersRepository();
//       print('object1, Bloc');

//       // Partnerlar ma'lumotlarini olish
//       final partnersResponse = await partnersRepository.getPartners(
//         event.id!,
//         event.site!,
//         event.phone!,
//         event.image!,
//       );
//       print('object2, Bloc');
//       emit(PartnersSuccessState());

//       if (partnersResponse.status == 200) {
//         print('object3, Bloc');
//         logger(partnersResponse.response.toString(), error: "PartnersBloc");
//         print('object4, Bloc');

//         emit(PartnersLoadedState(partners: partnersResponse.response!));
//         print('object5, Bloc');
//         emit(PartnersSuccessState());
//       } else {
//         emit(PartnersErrorState(GetPartnersErrorclass()));
//       }
//       emit(PartnersSuccessState());
//     } catch (e) {
//       emit(PartnersErrorState(GetPartnersErrorclass()));
//     }
//   }
// }
// import 'package:epolisplus/log/logger.dart';
// import 'package:epolisplus/repository/partners/partners_repository.dart';
// import 'package:epolisplus/utils/errors.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:epolisplus/models/models_export.dart';

// part 'partners_event.dart';
// part 'partners_state.dart';

class PartnersBloc extends Bloc<PartnersEvent, PartnersState> {
  PartnersBloc() : super(PartnersSuccessState()) {
    on<PartnersGetEvent>(partnersGet);
  }

  // Method to fetch partner data
  Future<void> partnersGet(
      PartnersGetEvent event, Emitter<PartnersState> emit) async {
    print('partnersGet called'); // Debugging print
    emit(PartnersLoadingState());
    try {
      final partnersRepository = PartnersRepository();
      print('Calling repository to fetch partners...'); // Debugging print

      // Fetch the partners data from the repository
      final partnersResponse = await partnersRepository.getPartners(
        event.id!,
        event.site!,
        event.phone!,
        event.image!,
      );
      print('Repository call complete.'); // Debugging print

      if (partnersResponse.status == 200) {
        print('Partners data fetched successfully.'); // Debugging print
        emit(PartnersLoadedState(partners: partnersResponse.response!));
      } else {
        print(
            'Error fetching partners: ${partnersResponse.message}'); // Debugging print
        emit(PartnersErrorState(GetPartnersErrorclass()));
      }
    } catch (e) {
      print('Error in fetching partners: $e'); // Debugging print
      emit(PartnersErrorState(GetPartnersErrorclass()));
    }
  }
}
