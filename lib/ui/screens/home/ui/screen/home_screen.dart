import 'package:epolisplus/ui/screens/home/bloc/home_bloc.dart';
// import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Dimens dimens;
  late HomeBloc homeBloc;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.whiteColor,
            // appBar: AppBar(
            //   actions: [
            //     IconButton(
            //       onPressed: () {
            //         context.read<HomeBloc>().add(DeleteAccountEvent());
            //       },
            //       icon: Icon(Icons.delete, color: AppColors.redColor),
            //     ),
            //     LogoutButtons(
            //       iconData: AppImage.logoutIcon,
            //       onClick: () {
            //         context.read<HomeBloc>().add(LogoutEvent());
            //       },
            //     ),
            //   ],
            // ),
            body: SizedBox(
              height: dimens.screenHeight,
              child: Stack(
                children: [
                  Image(
                    width: dimens.screenWidth,
                    image: AssetImage(
                      AppImage.homeBlueImage,
                    ),
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: EdgeInsets.all(
                      dimens.paddingHorizontal16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.myPolicies,
                          style: dimens.homeStyle,
                        ),
                        // ?
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  AppImage.personIcon,
                                  height: dimens.height24,
                                  // height: dimens.height18,
                                ),
                                Gap(dimens.paddingHorizontal8),
                                Text(
                                  'asadbek',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: dimens.font16,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  AppImage.shieldPlusIcon,
                                  height: dimens.height24,
                                  // height: dimens.height18,
                                ),
                                Gap(dimens.paddingHorizontal16),
                                Image.asset(
                                  AppImage.notificationIcon,
                                  height: dimens.height24,
                                  // height: dimens.height18,
                                ),
                                Gap(dimens.paddingHorizontal16),
                                Image.asset(
                                  AppImage.settingsIcon,
                                  height: dimens.height24,
                                  // height: dimens.height18,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        // ! Scrolls
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(8, (index) {
                              final buttonLabels = [
                                "Agree",
                                "Accept",
                                "Confirm",
                                "Proceed",
                                "Approve",
                                "Allow",
                                "Permit",
                                "Authorize"
                              ];

                              final buttonIcons = [
                                Icons.check,
                                Icons.done,
                                Icons.thumb_up,
                                Icons.arrow_forward,
                                Icons.verified,
                                Icons.check_circle,
                                Icons.thumb_up_alt,
                                Icons.security
                              ];

                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4.0,
                                ),
                                child: SizedBox(
                                  child: TextButton.icon(
                                    onPressed: () {},
                                    icon: Icon(buttonIcons[index],
                                        color: Colors.white),
                                    label: Text(
                                      buttonLabels[index],
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    style: TextButton.styleFrom(
                                      side: BorderSide(color: Colors.white),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                        // ! Scrol
                        Container(
                          height: dimens.height220,
                          width: dimens.screenWidth,
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(
                              dimens.radius14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
