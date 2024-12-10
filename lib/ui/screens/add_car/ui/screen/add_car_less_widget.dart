import 'package:epolisplus/ui/screens/add_car/bloc/my_car_bloc.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class AddCarLessWidget extends StatelessWidget {
  TextEditingController myCarNumber = TextEditingController();
  late Dimens dimens;
  late MyCarBloc myCarBloc;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) => MyCarBloc(carNumber: myCarNumber),
      child: BlocConsumer<MyCarBloc, MyCarState>(
        listener: (context, state) {},
        builder: (context, state) {
          myCarBloc = BlocProvider.of<MyCarBloc>(context);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AddCarTextfield(
                controller: TextEditingController(),
                // controller: myCarBloc.carNumber,
                showStar: true,
                titleText: AppStrings.stateNumber,
              ),
              Gap(dimens.paddingVerticalItem16),
              AddCarRowTextField(
                hintText1: AppStrings.addcaraff,
                hintText: AppStrings.addcar00,
                titleText: AppStrings.technicalPassportText,
                showStar: true,
              ),
              Gap(dimens.paddingVerticalItem7),
              ButtonPagesMin(
                appColors: AppColors.mainColor,
                iconData: AppImage.infocircleIcon,
                onClick: () {
                  myCarBloc.add(RegisterCertificateNumberEvent());
                },
                text: AppStrings.certificateNumberText,
              ),
            ],
          );
        },
      ),
    );
  }
}
