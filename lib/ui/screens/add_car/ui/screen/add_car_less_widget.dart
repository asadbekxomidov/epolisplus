import 'package:epolisplus/ui/screens/add_car/bloc/my_car_bloc.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class AddCarLessWidget extends StatelessWidget {
  late Dimens dimens;
  late MyCarBloc myCarBloc;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) => MyCarBloc(),
      child: BlocConsumer<MyCarBloc, MyCarState>(
        listener: (context, state) {
          if (state is CarErrorState) {
            showErrorMessageSnackBar(
              context,
              state.error,
            );
          }
        },
        builder: (context, state) {
          myCarBloc = BlocProvider.of<MyCarBloc>(context);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // AddCarTextfield(
              //   controller: myCarBloc.carNumberController,
              //   showStar: true,
              //   titleText: AppStrings.stateNumber,
              // ),
              // Gap(dimens.paddingVerticalItem16),
              // AddCarRowTextField(
              //   controller: myCarBloc.teachSeriaController,
              //   controller2: myCarBloc.teachPassportNumberController,
              //   hintText1: AppStrings.addcaraff,
              //   hintText: AppStrings.addcar00,
              //   titleText: AppStrings.technicalPassportText,
              //   showStar: true,
              // ),
              Gap(dimens.paddingVerticalItem7),
              ButtonPagesMin(
                appColors: AppColors.mainColor,
                iconData: AppImage.infocircleIcon,
                onClick: () {
                  myCarBloc.add(RegisterCertificateNumberEvent());
                },
                text: AppStrings.certificateNumberText,
              ),
              Gap(dimens.paddingVerticalItem12),
              Text(
                AppStrings.carOwnerText,
                style: dimens.textStyleSecondary,
              ),
              MyContainerWidget(
                text: "Asadbek Xomidov",
              ),
              Gap(dimens.paddingVerticalItem14),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.carBrandText,
                        style: dimens.textStyleSecondary,
                      ),
                      MyContainerRowWidget(
                        text: "Spark",
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppStrings.yearofManufactureText,
                        style: dimens.textStyleSecondary,
                      ),
                      MyContainerRowWidget(
                        text: "2020",
                      ),
                    ],
                  ),
                ],
              ),
              Gap(dimens.paddingVerticalItem14),
              RegisterPushButton(
                onClick: () {},
                text: AppStrings.addCarButtonText,
              ),
            ],
          );
        },
      ),
    );
  }
}
