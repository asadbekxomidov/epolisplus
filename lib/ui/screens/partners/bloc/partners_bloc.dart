import 'package:bloc/bloc.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:equatable/equatable.dart';
import 'package:epolisplus/utils/errors.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:epolisplus/models/models_export.dart';
import 'package:epolisplus/repository/partners/partners_repository.dart';

part 'partners_event.dart';
part 'partners_state.dart';

class PartnersBloc extends Bloc<PartnersEvent, PartnersState> {
  final PartnersRepository _partnersRepository;

  PartnersBloc()
      : _partnersRepository = PartnersRepository(),
        super(PartnersInitialState()) {
    on<PartnersGetEvent>(onPartnersGetEvent);
    on<PartnerPushWebEvent>(pushVeb);
    on<PartnerPushPhoneEvent>(pushPhone);
  }

  Future<void> onPartnersGetEvent(
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
      } else if (response.status == 401) {
        final token = SharedPreferencesManager();

        token.clearToken();
        token.clearPhone();
        token.clearPassword();
        Get.offAll(() => CheckAuthScreen());
      } else {
        emit(PartnersErrorState(GetPartnersErrorclass()));
      }
    } catch (error) {
      emit(PartnersErrorState(GetPartnersErrorclass()));
    }
  }

  Future<void> pushVeb(
      PartnerPushWebEvent event, Emitter<PartnersState> emit) async {
    try {
      if (event.url.isEmpty) {
        emit(PartnersErrorState(PartnersPushWebErrorclass()));
        return;
      }

      final Uri url = Uri.parse(event.url);

      bool launched = await launchUrl(url);

      if (!launched) {
        emit(PartnersErrorState(PartnersPushWebErrorclass()));
      } else {}
    } catch (e) {
      emit(PartnersErrorState(PartnersPushWebErrorclass()));
    }
  }

  Future<void> pushPhone(
      PartnerPushPhoneEvent event, Emitter<PartnersState> emit) async {
    try {
      if (event.phone.isEmpty) {
        emit(PartnersErrorState(PartnersPushWebErrorclass()));
        return;
      }

      final Uri phone = Uri.parse('tel:${event.phone}');

      bool launched = await launchUrl(phone);

      if (!launched) {
        emit(PartnersErrorState(PartnersPushWebErrorclass()));
      } else {}
    } catch (e) {
      emit(PartnersErrorState(PartnersPushWebErrorclass()));
    }
  }
}
