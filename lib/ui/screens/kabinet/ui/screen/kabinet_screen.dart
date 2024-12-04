import 'package:gap/gap.dart';
import 'package:epolisplus/ui/widgets/greenbackground.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          kabinetBloc = BlocProvider.of<KabinetBloc>(context);

          if (state is KabinetLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
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
}

String formatPhoneNumber(String phone) {
  String cleanPhone = phone.replaceAll(RegExp(r'\D'), '');

  return '+${cleanPhone.substring(0, 3)} (${cleanPhone.substring(3, 5)}) ${cleanPhone.substring(5, 8)}-${cleanPhone.substring(8, 10)}-${cleanPhone.substring(10, 12)}';
}
