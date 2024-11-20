import 'package:epolisplus/ui/widgets/showdialog_widget.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

part 'tabbar_event.dart';
part 'tabbar_state.dart';

class TabbarBloc extends Bloc<TabbarEvent, TabbarState> {
  int currentIndex = 0;

  TabbarBloc() : super(const TabbarInitialState(0)) {
    //   on<HomeScreenPushEvent>(homePush);
    //   on<KabinetScreenPushEvent>(kabinetPush);
    //   on<PoliciesScreenPushEvent>(policiesPush);
    //   on<PartnersScreenPushEvent>(partnersPush);
    //   on<SosScreenPushEvent>(sosDilog);
    on<TabSelectedEvent>(onTap);
  }

/*  Future<void> homePush(
      HomeScreenPushEvent event, Emitter<TabbarState> emit) async {
    */ /* emit(TabbarLoadedState());
    Get.to(() => HomeScreen());*/ /*
    emit(HomeState2());
  }

  Future<void> kabinetPush(
      KabinetScreenPushEvent event, Emitter<TabbarState> emit) async {
*/ /*    emit(TabbarLoadedState());
    Get.to(() => KabinetScreen());*/ /*
    emit(CabinetState());
  }

  Future<void> sosDilog(
      SosScreenPushEvent event, Emitter<TabbarState> emit) async {
    // emit(TabbarLoadedState());
    showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (context) {
        return ShowdialogWidget();
      },
    );
    emit(SosState());
  }

  Future<void> policiesPush(
      PoliciesScreenPushEvent event, Emitter<TabbarState> emit) async {
*/ /*    emit(TabbarLoadedState());
    Get.to(() => PoliciesScreen());*/ /*
    emit(PolicyState());
  }

  Future<void> partnersPush(
      PartnersScreenPushEvent event, Emitter<TabbarState> emit) async {
*/ /*    emit(TabbarLoadedState());
    Get.to(() => PartnersScreen());*/ /*
    emit(PartnerState());
  }

  // Future<void> pushScreen(
  //     TabScreenPushEvent event, Emitter<TabbarState> emit) async {
  //   switch (event.index) {
  //     case 0:
  //       Get.to(() => HomeScreen());
  //       break;
  //     case 1:
  //       Get.to(() => KabinetScreen());
  //       break;
  //     case 2:
  // showDialog(
  //   context: Get.context!,
  //   barrierDismissible: true,
  //   builder: (context) {
  //     return ShowdialogWidget();
  //   },
  // );
  //       break;
  //     case 3:
  //       Get.to(() => PoliciesScreen());
  //       break;
  //     case 4:
  //       Get.to(() => PartnersScreen());
  //       break;
  //   }
  // }*/

  onTap(TabSelectedEvent event, Emitter<TabbarState> emit) {
    currentIndex = event.index;
    switch (currentIndex) {
      case 0:
        {
          emit(HomeState2());
          return;
        }
      case 1:
        {
          emit(CabinetState());
          return;
        }
      case 2:
        {
          showDialog(
            context: Get.context!,
            barrierDismissible: true,
            builder: (context) {
              return ShowdialogWidget();
            },
          );
          emit(SosState());
          return;
        }
      case 3:
        {
          emit(PolicyState());
          return;
        }
      case 4:
        {
          emit(PartnerState());
          return;
        }
    }
  }
}
