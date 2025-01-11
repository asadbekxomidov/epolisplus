import 'package:get/get.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/repository/profil/profil_repository.dart';
import 'package:epolisplus/ui/screens/modul/addedcar/bloc/add_car_bloc.dart';
import 'package:epolisplus/models/profil/profil_response/carinforesponse/car_information_response.dart';

part 'my_car_event.dart';
part 'my_car_state.dart';

class MyCarBloc extends Bloc<MyCarEvent, MyCarState>
    implements OnVehicleListener {
  OnVehicleListener listener;
  CarInformationResponse vehicleInformation;

  bool get isHaveCarInfor {
    return vehicleInformation.error == "0";
  }

  MyCarBloc({required this.listener, required this.vehicleInformation})
      : super(CarInitialState()) {
    on<AddCarEvent>(addCar);
  }

  @override
  void clearData() {}

  @override
  void onVehicle(CarInformationResponse vehicle) {}

  @override
  void onWait(bool isProgressbar) {}

  Future<void> addCar(AddCarEvent event, Emitter<MyCarState> emit) async {
    emit(CarLoadedState());

    try {
      final ProfilRepository repository = ProfilRepository();

      var data = vehicleInformation.toJson();
      if (data.isNotEmpty) {
        var baseResponse = await repository.addUserCar(data);

        if (baseResponse.status == 200) {
          Get.back();
          emit(CarSuccesState());
        } else {
          emit(MyCarErrorState(baseResponse.message!));
        }
      }
    } catch (e) {
      emit(MyCarErrorState(e.toString()));
    }
  }
}

class DefaultVehicleListener implements OnVehicleListener {
  @override
  void clearData() {}

  @override
  void onVehicle(CarInformationResponse vehicle) {}

  @override
  void onWait(bool isProgressbar) {}
}
