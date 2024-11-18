import 'package:epolisplus/log/logger.dart';
import 'package:epolisplus/repository/partners/partners_repository.dart';
import 'package:epolisplus/utils/errors.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/models/models_export.dart';
part 'partners_event.dart';
part 'partners_state.dart';

class PartnersBloc extends Bloc<PartnersEvent, PartnersState> {
  PartnersBloc() : super(PartnersSuccessState()) {
    on<PartnersGetEvent>(partnersGet);
  }

  // Ma'lumotlarni olish uchun metod
  Future<void> partnersGet(
      PartnersGetEvent event, Emitter<PartnersState> emit) async {
    emit(PartnersLoadingState());
    try {
      final partnersRepository = PartnersRepository();
      print('object1, Bloc');

      // Partnerlar ma'lumotlarini olish
      final partnersResponse = await partnersRepository.getPartners(
        event.id,
        event.site,
        event.phone,
        event.image,
      );
      print('object2, Bloc');
      emit(PartnersSuccessState());

      if (partnersResponse.status == 200) {
        print('object3, Bloc');
        logger(partnersResponse.response.toString(), error: "PartnersBloc");
        print('object4, Bloc');

        emit(PartnersLoadedState(partners: partnersResponse.response!));
        print('object5, Bloc');
        emit(PartnersSuccessState());
      } else {
        emit(PartnersErrorState(GetPartnersErrorclass()));
      }
      emit(PartnersSuccessState());
    } catch (e) {
      emit(PartnersErrorState(GetPartnersErrorclass()));
    }
  }
}
