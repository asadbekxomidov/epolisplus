import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/ui/widgets/buttons.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/models/models_export.dart';
import 'package:epolisplus/ui/widgets/greenbackground.dart';
import 'package:epolisplus/ui/screens/kabinet/bloc/kabinet_bloc.dart';

class CabinetScreen extends StatefulWidget {
  @override
  State<CabinetScreen> createState() => _CabinetScreenState();
}

class _CabinetScreenState extends State<CabinetScreen> {
  late Dimens dimens;
  late KabinetBloc kabinetBloc;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) => KabinetBloc()..add(KabinetGetEvent()),
      child: BlocConsumer<KabinetBloc, KabinetState>(
        listener: (context, state) {
          if (state is KabinetErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.failure.getErrorMessage(context),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          kabinetBloc = BlocProvider.of<KabinetBloc>(context);

          if (state is KabinetLoadingState) {
            return GreenImageBackground(
              child: LoadingPages(),
            );
          }
          if (state is KabinetInformationGetState) {
            final profil = state.profilResponse;
            final carInfoList = profil.carInfo;

            return Scaffold(
              body: GreenImageBackground(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: dimens.paddingHorizontal16,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(dimens.paddingVerticalItem59),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppStrings.cabientText,
                              style: dimens.pagesTitleSty,
                            ),
                            InkWell(
                              onTap: () {
                                kabinetBloc.add(
                                  KabinetPushScreenEvent(profil.fullName),
                                );
                              },
                              splashColor: AppColors.transparentColor,
                              highlightColor: AppColors.transparentColor,
                              child: Image.asset(
                                AppImage.cabinetEditIcon,
                                height: dimens.height24,
                              ),
                            ),
                          ],
                        ),
                        Gap(dimens.paddingVerticalItem8),
                        Text(
                          AppStrings.yourname,
                          style: dimens.pagesTextSty,
                        ),
                        Gap(dimens.paddingVerticalItem4),
                        Text(
                          profil.fullName,
                          style: dimens.pagesYourNameSty,
                        ),
                        Gap(dimens.paddingVerticalItem8),
                        Text(
                          AppStrings.phoneNumberHint,
                          style: dimens.pagesTextSty,
                        ),
                        Gap(dimens.paddingVerticalItem4),
                        Text(
                          profil.phone,
                          style: dimens.pagesYourNameSty,
                        ),
                        Gap(dimens.paddingVerticalItem16),
                        my_car_widget(profil, carInfoList),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Scaffold(
              body: GreenImageBackground(
                child: Container(),
              ),
            );
          }
        },
      ),
    );
  }

  my_car_widget(ProfilResponse profil, List<CarInfoResponse> carInfoList) {
    return carInfoList.isEmpty
        ? GestureDetector(
            onTap: () {
              kabinetBloc.add(AddMyCarEvent());
            },
            child: Container(
                padding: EdgeInsets.all(
                  dimens.paddingVerticalItem16,
                  // dimens.paddingVerticalItem36,
                ),
                height: dimens.height208,
                width: dimens.screenWidth,
                decoration: cardContainerDecoration(dimens),
                child: Column(
                  children: [
                    Image.asset(
                      AppImage.carNotIcon,
                      height: dimens.height58,
                    ),
                    Gap(dimens.paddingVerticalItem4),
                    Text(
                      AppStrings.savedCarsText,
                      style: dimens.pagesCardTextSty,
                    ),
                    Gap(dimens.paddingVerticalItem12),
                    PagesRowButtons(
                      image: AppImage.addIcon,
                      text: AppStrings.addCarButtonText,
                      onClick: () {
                        kabinetBloc.add(AddMyCarEvent());
                      },
                    ),
                  ],
                )),
          )
        : Column(
            children: [
              car_list(carInfoList),
              add_my_car_btn(),
            ],
          );
  }

  car_list(List<CarInfoResponse> carInfoList) {
    return Column(
      children: carInfoList.map((car) {
        return Card(
          color: AppColors.cardContainerColor,
          child: Container(
            padding: EdgeInsets.all(
              dimens.paddingAll20,
            ),
            width: dimens.screenWidth,
            decoration: myCarCardDecoration(dimens),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Text(
                              "${car.modelName}",
                              style: dimens.font24Blackw600Sty,
                            ),
                          ],
                        ),
                        Gap(dimens.paddingHorizontal4),
                        Text(
                          "${car.issueYear} год",
                          style: dimens.font14Greyw400Sty,
                        ),
                      ],
                    ),
                    DeleteButton(
                      onClick: () {
                        kabinetBloc.add(
                          MyCarDeleteEvent(car.govNumber),
                        );
                      },
                      icon: CupertinoIcons.delete,
                    ),
                  ],
                ),
                Gap(dimens.paddingVerticalItem8),
                Container(
                  height: dimens.height32,
                  width: dimens.width142,
                  decoration: getMyCarContainerDeco(dimens),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Gap(dimens.paddingHorizontal2),
                      Text(
                        "${car.govNumber}",
                        style: dimens.font20Blackw400Sty,
                      ),
                      SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppImage.uzbFlagIcon,
                              height: dimens.height7_5,
                            ),
                            Text(
                              AppStrings.uzflagText,
                              style: dimens.cardUzFlagSty2,
                            ),
                          ],
                        ),
                      ),
                      Gap(dimens.paddingHorizontal2),
                    ],
                  ),
                ),
                Gap(dimens.paddingVerticalItem8),
                Row(
                  children: [
                    Text(
                      "${car.techSeriya}",
                      style: dimens.font14Greyw400Sty,
                    ),
                    Text(
                      " ${car.techNumber}",
                      style: dimens.font14Greyw400Sty,
                    ),
                  ],
                ),
                Gap(dimens.paddingVerticalItem8),
                Text(
                  AppStrings.pointTextMinus,
                  style: dimens.pointMinusSty,
                ),
                Gap(dimens.paddingVerticalItem8),
                Text(
                  AppStrings.carOwner,
                  style: dimens.font14Greyw400Sty,
                ),
                Text(
                  "${car.orgName} o'g'li",
                  style: dimens.font16Blackw400Sty,
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  add_my_car_btn() {
    return PagesButton(
      image: AppImage.addIcon,
      text: AppStrings.addCarButtonText,
      onClick: () {
        kabinetBloc.add(AddMyCarEvent());
      },
    );
  }
}



/*
String formatPhoneNumber(String phone) {
  String cleanPhone = phone.replaceAll(RegExp(r'\D'), '');

  return '+${cleanPhone.substring(0, 3)} (${cleanPhone.substring(3, 5)}) ${cleanPhone.substring(5, 8)}-${cleanPhone.substring(8, 10)}-${cleanPhone.substring(10, 12)}';
}
*/
