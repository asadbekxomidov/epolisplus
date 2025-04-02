// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:get/get.dart';
import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/models/models_export.dart';
import 'package:epolisplus/ui/screens/travel/widget/travel_widget.dart';
import 'package:epolisplus/ui/screens/modul/user_info/bloc/user_info_bloc.dart';

part 'travel_event.dart';
part 'travel_state.dart';

class TravelBloc extends Bloc<TravelEvent, TravelState> {
  bool selecrtTr = true;
  late int currentindex;
  List<String> countriesLst = [];
  int index = IConstanta.STEP_VEHICLE;
  // late int index = IConstanta.STEP_DRIVER;
  // late int index = IConstanta.STEP_CONTACT;
  // late int index = IConstanta.STEP_PAYMENT;
  List<String> countries = MyList.countriesLst;
  List<String> selectCountriesType = MyList.countiesTypeLst;
  TextEditingController countriesController = TextEditingController();

  String? selectDates3;
  String? endTimeTravel;
  String? startTimeTravel;
  String? selectTravelType;
  String endcurrentDate = DateFormat('dd.MM.yyyy').format(DateTime.now());
  String startcurrentDate = DateFormat('dd.MM.yyyy').format(DateTime.now());
  String dates3aa = DateFormat('dd.MM.yyyy').format(DateTime.now());
  DateFormat dateFormat = DateFormat("dd.MM.yyyy");
  int? daysDifference;

  TravelBloc() : super(SuccessState()) {
    on<CountriesAddEvent>(addCountries);
    on<RemoveCountriesEvent>(removeCountries);
    on<SelectedTravelTimeEvent>(selectTrTime);
    on<TravelStartTimeEvent>(selectStartTime);
    on<TravelEndTimeEvent>(selectEndTime);
    on<SelectCountriesTypeEvent>(selectType);
    on<SelectDatesEvent>(selectDates);
    on<NextStep2Event>(nextStep2);
    on<NextStep3Event>(nextStep3);
    on<NextStep4Event>(nextStep4);
    on<CalculateDaysDifferenceEvent>(_calculateDaysDifference);
  }

  List<String> get selectedCountries => countriesLst;

  bool get isHaveCountries => countriesLst.isNotEmpty;

  String get selectTypeTravel {
    print('${selectTravelType} TYPETYPETYPETYPETYPETYPETYPE');
    return selectTravelType ?? '';
  }

  String get startTime {
    // return userBirthDateNow ?? "дд.мм.гггг";
    return startTimeTravel ?? startcurrentDate;
    // return startTimeTravel != null ? startcurrentDate : startTimeTravel!;
  }

  String get endTime {
    // return userBirthDateNow ?? "дд.мм.гггг";
    return endTimeTravel ?? endcurrentDate;
    // return endTimeTravel != null ? endcurrentDate : endTimeTravel!;
  }

  int getDaysDifference() {
    return daysDifference ?? 1;
  }

  String get selectDatesType {
    // return userBirthDateNow ?? "дд.мм.гггг";
    return selectDates3 ?? startcurrentDate;
    // return startTimeTravel != null ? startcurrentDate : startTimeTravel!;
  }

  Future<void> _calculateDaysDifference(
      CalculateDaysDifferenceEvent event, Emitter<TravelState> emit) async {
    try {
      DateTime startTimeDate = dateFormat.parse(startTime);
      DateTime endTimeDate = dateFormat.parse(endTime);

      Duration difference = endTimeDate.difference(startTimeDate);
      daysDifference = difference.inDays;
      emit(SuccessState());
    } catch (e) {
      print("Xato: ${e.toString()}");
    }
  }

  Future<void> selectTrTime(
      SelectedTravelTimeEvent event, Emitter<TravelState> emit) async {
    emit(LoadingState());
    selecrtTr = !selecrtTr;
    emit(SuccessState());
  }

  Future<void> selectDates(
      SelectDatesEvent event, Emitter<TravelState> emit) async {
    emit(LoadedState());
    String userBirthDate = DateTime.now().toString();

    DateTime? selectedDate = await showDialog<DateTime>(
      context: Get.context!,
      builder: (context) {
        return SelectDatesDilog(birthDate: userBirthDate);
      },
    );

    if (selectedDate != null) {
      print("Foydalanuvchi tanlagan sana: ${selectedDate.toString()}");
      selectDates3 = DateFormat('dd.MM.yyyy').format(selectedDate);
      print('FormatLangan Sana ${selectDates3}');
      emit(SuccessState());
    }
  }

  Future<void> addCountries(
      CountriesAddEvent event, Emitter<TravelState> emit) async {
    emit(LoadedState());
    final selectedCountry = await showModalBottomSheet<String>(
      context: Get.context!,
      isScrollControlled: true,
      builder: (context) {
        return SelectCountries(lst: countries);
      },
    );

    if (selectedCountry != null) {
      if (!countriesLst.contains(selectedCountry)) {
        countriesLst.add(selectedCountry);
        emit(SuccessState());
      } else {
        emit(ErrorState(ServerFailure(message: '')));
      }
    } else {
      emit(ErrorState(ServerFailure(message: '')));
    }
  }

  Future<void> removeCountries(
      RemoveCountriesEvent event, Emitter<TravelState> emit) async {
    emit(LoadedState());
    if (event.index >= 0 && event.index < countriesLst.length) {
      countriesLst.removeAt(event.index);
      emit(SuccessState());
    } else {
      emit(ErrorState(ServerFailure(message: '')));
    }
  }

  Future<void> selectStartTime(
      TravelStartTimeEvent event, Emitter<TravelState> emit) async {
    emit(LoadedState());
    String userBirthDate = DateTime.now().toString();

    DateTime? selectedDate = await showDialog<DateTime>(
      context: Get.context!,
      builder: (context) {
        return SelectDatesDilog(birthDate: userBirthDate);
      },
    );

    if (selectedDate != null) {
      print("Foydalanuvchi tanlagan sana: ${selectedDate.toString()}");
      startTimeTravel = DateFormat('dd.MM.yyyy').format(selectedDate);
      print('FormatLangan Sana ${startTimeTravel}');

      add(CalculateDaysDifferenceEvent());
      emit(SuccessState());
    }
  }

  Future<void> selectEndTime(
      TravelEndTimeEvent event, Emitter<TravelState> emit) async {
    emit(LoadedState());
    String userBirthDate = DateTime.now().toString();

    DateTime? selectedDate = await showDialog<DateTime>(
      context: Get.context!,
      builder: (context) {
        return SelectDatesDilog(birthDate: userBirthDate);
      },
    );

    if (selectedDate != null) {
      print("Foydalanuvchi tanlagan sana: ${selectedDate.toString()}");
      endTimeTravel = DateFormat('dd.MM.yyyy').format(selectedDate);
      print('FormatLangan Sana ${endTimeTravel}');

      add(CalculateDaysDifferenceEvent());
      emit(SuccessState());
    }
  }

  Future<void> selectType(
      SelectCountriesTypeEvent event, Emitter<TravelState> emit) async {
    emit(LoadedState());
    final selectedType = await showModalBottomSheet<String>(
      context: Get.context!,
      builder: (context) {
        return CountriesSelectType(
          countriesLst: selectCountriesType,
        );
      },
    );

    if (selectedType != null) {
      print('${selectedType}QEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE');
      selectTravelType = selectedType;
      emit(SuccessState());
    }
  }

  Future<void> nextStep2(
      NextStep2Event event, Emitter<TravelState> emit) async {
    emit(LoadingState());
    if (countriesLst.isNotEmpty) {
      index = IConstanta.STEP_DRIVER;
    } else {
      emit(ErrorState(ServerFailure(message: 'Davlatni Tanlang')));
    }

    emit(SuccessState());
  }

  Future<void> nextStep3(
      NextStep3Event event, Emitter<TravelState> emit) async {
    index = IConstanta.STEP_CONTACT;
    emit(SuccessState());
  }

  Future<void> nextStep4(
      NextStep4Event event, Emitter<TravelState> emit) async {
    index = IConstanta.STEP_PAYMENT;
    emit(SuccessState());
  }
}

class UserInFoBloc extends Bloc<TravelEvent, TravelState>
    implements OnUserInforListener {
  bool mytravel = true;
  bool familytrip = false;
  bool checkinsurerinfo = true;
  var userInformation = UserInfoResponse();
  var listActivateCode = <TravelUsersModel>[
    TravelUsersModel(
      model: UserInfoResponse(
        error: '',
        pinfl: '',
        address: '',
        lastName: '',
        regionId: '',
        firstName: '',
        middleName: '',
        districtId: '',
        lastNameENG: '',
        fullNameTMR: '',
        firstNameENG: '',
        errorMessage: '',
      ),
      count: 1,
    ),
  ];

  UserInFoBloc() : super(SuccessState()) {
    on<IsCheckUserInfoUIEvent>(ischeckUI);
    on<IsCheckUserTravelEvent>(isCheckUser);
    on<IsCheckFamilyTravelEvent>(isCheckFamily);
    on<AddUserTravelEvent>(travelerscom);
  }

  @override
  void onUserInfo(UserInfoResponse userInfo) {
    userInformation = userInfo;
    emit(SuccessState());
  }

  @override
  void onWait(bool isProgressbar) {
    if (isProgressbar) {
      print('Loading...');
    } else {
      print('Finished Loading...');
    }
  }

  Future<void> ischeckUI(
      IsCheckUserInfoUIEvent event, Emitter<TravelState> emit) async {
    emit(LoadingState());
    checkinsurerinfo = !checkinsurerinfo;
    emit(SuccessState());
  }

  Future<void> isCheckUser(
      IsCheckUserTravelEvent event, Emitter<TravelState> emit) async {
    emit(LoadingState());
    mytravel = !mytravel;
    emit(SuccessState());
  }

  Future<void> isCheckFamily(
      IsCheckFamilyTravelEvent event, Emitter<TravelState> emit) async {
    emit(LoadingState());
    familytrip = !familytrip;
    emit(SuccessState());
  }

  Future<void> travelerscom(
      AddUserTravelEvent event, Emitter<TravelState> emit) async {
    emit(LoadingState());
  }
}

class ContractBloc extends Bloc<TravelEvent, TravelState> {
  bool isVertical = true;
  bool isSelectService = false;
  ContractBloc() : super(SuccessState()) {
    on<ContractVerticalEvent>(isVerFunc);
    on<SelectServiceEvent>(selectService);
  }

  Future<void> isVerFunc(
      ContractVerticalEvent event, Emitter<TravelState> emit) async {
    emit(LoadingState());
    isVertical = !isVertical;
    emit(SuccessState());
  }

  Future<void> selectService(
      SelectServiceEvent event, Emitter<TravelState> emit) async {
    emit(LoadingState());
    isSelectService = !isSelectService;
    emit(SuccessState());
  }
}

class PayMentBloc extends Bloc<TravelEvent, TravelState> {
  PayMentBloc() : super(SuccessState()) {}
}
