import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/models/models_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
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

    return Scaffold(
      body: BlocProvider(
        create: (context) => KabinetBloc()..add(KabinetGetEvent()),
        child: Stack(
          children: [
            green_background(dimens),
            ui(),
            loading(),
          ],
        ),
      ),
    );
  }

  loading() {
    return BlocBuilder<KabinetBloc, KabinetState>(
      builder: (context, state) {
        return LoadingIndicator2(
          isLoading: state is KabinetLoadingState,
        );
      },
    );
  }

  ui() {
    return SafeArea(
      child:
          BlocConsumer<KabinetBloc, KabinetState>(listener: (context, state) {
        if (state is KabinetErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.failure.getErrorMessage(context),
              ),
            ),
          );
        }
      }, builder: (context, state) {
        kabinetBloc = BlocProvider.of<KabinetBloc>(context);

        final profil = kabinetBloc.profilResponse;
        final carInfoList = profil.carInfo;

        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: dimens.paddingHorizontal16,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(dimens.paddingVerticalItem8),
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
                Text(
                  kabinetBloc.isHaveUserName,
                  style: dimens.pagesYourNameSty,
                ),
                Gap(dimens.paddingVerticalItem8),
                Text(
                  AppStrings.phoneNumberHint,
                  style: dimens.pagesTextSty,
                ),
                Text(
                  kabinetBloc.isHaveUserPhoneNumber,
                  style: dimens.pagesYourNameSty,
                ),
                Gap(dimens.paddingVerticalItem16),
                my_car_widget(profil, carInfoList),
              ],
            ),
          ),
        );
      }),
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
                decoration: newEditDecoration(dimens),
                // decoration: cardContainerDecoration(dimens),
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
              Gap(dimens.paddingVerticalItem4),
              add_my_car_btn(),
              Gap(dimens.paddingVerticalItem12),
            ],
          );
  }

  car_list(List<CarInfoResponse> carInfoList) {
    return Column(
      children: carInfoList.map((car) {
        return Container(
          margin: EdgeInsets.symmetric(
            vertical: dimens.paddingVerticalItem4,
          ),
          padding: EdgeInsets.all(
            dimens.paddingAll20,
          ),
          width: dimens.screenWidth,
          decoration: newEditDecoration(dimens),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: dimens.width32,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: AppColors.blackColor,
                            width: dimens.width1_5,
                          ),
                        ),
                      ),
                      child: Text(
                        car.govNumber.substring(0, 2),
                        style: dimens.govfont16Blackw500Sty,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        formatString(car.govNumber.substring(2)),
                        // car.govNumber.substring(2),
                        style: dimens.govfont16Blackw500Sty,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppImage.uzbFlagIcon, // Bayroq rasmi
                          height: dimens.height10,
                        ),
                        Text(
                          AppStrings.uzflagText, // "uz" matni
                          style: dimens.cardUzFlagSty2,
                        ),
                      ],
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
                car.orgName,
                style: dimens.font16Blackw400Sty,
              ),
            ],
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

String formatString(String input) {
  final regex = RegExp(r'([A-Z]+)(\d+)([A-Z]+)');
  final match = regex.firstMatch(input);

  if (match != null) {
    return '${match.group(1)} ${match.group(2)} ${match.group(3)}'
        .replaceAll(RegExp(r'\s+'), ' ');
  }

  return input;
}


// String formaGovNumber(String input) {
//   final regex = RegExp(r'([A-Z]+)(\d+)([A-Z]+)');
//   final match = regex.firstMatch(input);

//   if (match != null) {
//     return '${match.group(1)} ${match.group(2)} ${match.group(3)}';
//   }

//   return input; 
// }

/*
String formatPhoneNumber(String phone) {
  String cleanPhone = phone.replaceAll(RegExp(r'\D'), '');

  return '+${cleanPhone.substring(0, 3)} (${cleanPhone.substring(3, 5)}) ${cleanPhone.substring(5, 8)}-${cleanPhone.substring(8, 10)}-${cleanPhone.substring(10, 12)}';
}
*/
