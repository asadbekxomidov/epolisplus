import 'package:epolisplus/models/profil/profil_response/profil_response.dart';
import 'package:epolisplus/ui/screens/kabinet/bloc/kabinet_bloc.dart';
import 'package:epolisplus/ui/widgets/buttons.dart';
import 'package:epolisplus/ui/widgets/greenbackground.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gap/gap.dart';

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
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          kabinetBloc = BlocProvider.of<KabinetBloc>(context);

          if (state is KabinetLoadingState) {
            return GreenImageBackground(
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is KabinetInformationGetState) {
            final profil = state.profilResponse;
            return Scaffold(
              // Scaffold qo'shildi
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
                                    KabinetPushScreenEvent(profil.fullName));
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
                          formatPhoneNumber(profil.phone),
                          style: dimens.pagesYourNameSty,
                        ),
                        Gap(dimens.paddingVerticalItem16),
                        my_car_widget(profil),
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

  my_car_widget(ProfilResponse profil) {
    return profil.carInfo.length == 0
        ? GestureDetector(
            onTap: () {
              kabinetBloc.add(AddMyCarEvent());
            },
            child: Container(
              alignment: Alignment.center,
              height: dimens.height208,
              width: dimens.screenWidth,
              decoration: cardContainerDecoration(dimens),
              child: Text(
                "add my car",
                style: dimens.textStyle,
              ),
            ),
          )
        : Column(
            children: [
              car_list(),
              add_my_car_btn(),
            ],
          );
  }

  car_list() {
    return Column(
      children: [
        Card(
          color: AppColors.cardContainerColor,
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: dimens.paddingVerticalItem8,
              horizontal: dimens.paddingHorizontal4,
            ),
            height: dimens.height208,
            width: dimens.screenWidth,
            decoration: cardContainerDecoration(dimens),
          ),
        ),
        Card(
          color: AppColors.cardContainerColor,
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: dimens.paddingVerticalItem8,
              horizontal: dimens.paddingHorizontal4,
            ),
            height: dimens.height208,
            width: dimens.screenWidth,
            decoration: cardContainerDecoration(dimens),
          ),
        ),
      ],
    );
  }

  add_my_car_btn() {
    return RegisterPushButton(
      onClick: () {
        kabinetBloc.add(AddMyCarEvent());
      },
      text: "add my car",
    );
  }
}

String formatPhoneNumber(String phone) {
  String cleanPhone = phone.replaceAll(RegExp(r'\D'), '');

  return '+${cleanPhone.substring(0, 3)} (${cleanPhone.substring(3, 5)}) ${cleanPhone.substring(5, 8)}-${cleanPhone.substring(8, 10)}-${cleanPhone.substring(10, 12)}';
}
