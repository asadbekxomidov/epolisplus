import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:epolisplus/utils/resource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/ui/widgets/buttons.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/screens/home/bloc/home_bloc.dart';
import 'package:epolisplus/ui/screens/kabinet/bloc/kabinet_bloc.dart';
import 'package:epolisplus/ui/widgets/background/widget/background_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Dimens dimens;
  late HomeBloc homeBloc;
  late KabinetBloc kabinetBloc;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
        BlocProvider(
          create: (context) => KabinetBloc()
            ..add(
              KabinetGetEvent(),
            ),
        ),
      ],
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          Widget background = green_background(dimens);
          if (state is HomeSerCategoryChangedState) {
            background = state.categoryId == IConstanta.HOME_KASKO
                ? green_background(dimens)
                : state.categoryId == IConstanta.HOME_OSAGO
                    ? blue_background(dimens)
                    : state.categoryId == IConstanta.HOME_TRAVEL
                        ? red_background(dimens)
                        : state.categoryId == IConstanta.HOME_SERVICES
                            ? green_background(dimens)
                            : state.categoryId == IConstanta.HOME_GARANTY
                                ? green_background(dimens)
                                : black_background(dimens);
          }

          Widget select_service = green_background(dimens);
          if (state is HomeSerCategoryChangedState) {
            background = state.categoryId == IConstanta.HOME_KASKO
                ? green_background(dimens)
                : state.categoryId == IConstanta.HOME_OSAGO
                    ? blue_background(dimens)
                    : state.categoryId == IConstanta.HOME_TRAVEL
                        ? red_background(dimens)
                        : state.categoryId == IConstanta.HOME_SERVICES
                            ? green_background(dimens)
                            : state.categoryId == IConstanta.HOME_GARANTY
                                ? green_background(dimens)
                                : black_background(dimens);
          }

          return Scaffold(
            body: Stack(
              children: [
                background,
                // blue_gradient_widget(dimens),
                ui(),
                loadingHome(),
                loadingUserSer(),
              ],
            ),
          );
        },
      ),
    );
  }

  loadingHome() {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return LoadingIndicator2(
          isLoading: state is HomeLoadingState,
        );
      },
    );
  }

  loadingUserSer() {
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
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeErrorState) {
            return showErrorMessageSnackBar(context, state.errorMessage);
          }
        },
        builder: (context, state) {
          homeBloc = BlocProvider.of<HomeBloc>(context);
          kabinetBloc = BlocProvider.of<KabinetBloc>(context);

          return SizedBox(
            height: dimens.screenHeight,
            width: dimens.screenWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(dimens.paddingVerticalItem10),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: dimens.paddingWidth,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                AppImage.personIcon,
                                height: dimens.height24,
                              ),
                              Gap(dimens.paddingHorizontal8),
                              Text(
                                kabinetBloc.isHaveUserName,
                                // 'asadbek',
                                style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: dimens.font16,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  homeBloc.add(PushWarrantyEvent());
                                },
                                child: Image.asset(
                                  AppImage.shieldPlusIcon,
                                  height: dimens.height24,
                                ),
                              ),
                              Gap(dimens.paddingHorizontal16),
                              InkWell(
                                onTap: () {
                                  homeBloc.add(OpenNotificationEvent());
                                },
                                child: Image.asset(
                                  AppImage.notificationIcon,
                                  height: dimens.height24,
                                ),
                              ),
                              Gap(dimens.paddingHorizontal16),
                              InkWell(
                                onTap: () {
                                  homeBloc.add(PushScreensEvent());
                                },
                                child: Image.asset(
                                  AppImage.settingsIcon,
                                  height: dimens.height24,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Gap(dimens.paddingVerticalItem8),
                      Text(
                        AppStrings.myPolicies,
                        style: dimens.homeStyle,
                      ),
                    ],
                  ),
                ),
                Gap(dimens.paddingVerticalItem8),
                select_service(homeBloc),
                Gap(dimens.paddingVerticalItem8),
                select_services_wid(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: dimens.paddingVerticalItem8,
                        horizontal: dimens.paddingWidth,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 5,
                                child: GestureDetector(
                                  onTap: () {
                                    homeBloc.add(OpenAddServisePEvent());
                                  },
                                  child: RecButton(
                                    decoration: servicesDecoration(dimens),
                                    title: AppStrings.servicesText,
                                    image: AppImage.serviseIcon,
                                  ),
                                ),
                              ),
                              Gap(dimens.paddingHorizontal8),
                              Expanded(
                                flex: 5,
                                child: GestureDetector(
                                  onTap: () {
                                    homeBloc.add(PushWarrantyEvent());
                                  },
                                  child: RecButton(
                                    decoration: guarantDecoration(dimens),
                                    title: AppStrings.guarant,
                                    image: AppImage.guarantIcon,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Gap(dimens.paddingVerticalItem16),
                          Text(
                            AppStrings.insurancePrograms,
                            style: dimens.insuranceProgramsSty,
                          ),
                          Gap(dimens.paddingVerticalItem16),
                          HomePageButtonMain(
                            onClick: () {
                              homeBloc.add(OpenCaskoEvent());
                            },
                            decoration: kaskoDecorationsCon(dimens),
                            iconData: AppImage.arrowcirclerightIcon,
                            image: AppImage.kaskolHomeIcon,
                            text: AppStrings.kasko,
                          ),
                          Gap(dimens.paddingVerticalItem8),
                          HomePageButtonMain(
                            onClick: () {
                              homeBloc.add(OpenOsagoEvent());
                            },
                            decoration: osagoDecorationsCon(dimens),
                            iconData: AppImage.arrowcirclerightIcon,
                            image: AppImage.osagoHomeIcon,
                            text: AppStrings.osago,
                          ),
                          Gap(dimens.paddingVerticalItem8),
                          HomePageButtonMain(
                            onClick: () {
                              homeBloc.add(OpenTravelEvent());
                            },
                            decoration: travelDecorationsCon(dimens),
                            iconData: AppImage.arrowcirclerightIcon,
                            image: AppImage.travelHomeIcon,
                            text: AppStrings.travel,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  select_services_wid() {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: dimens.paddingVerticalItem4,
        horizontal: dimens.paddingWidth,
      ),
      height: dimens.height220,
      width: dimens.screenWidth,
      decoration: myWidgetDeco(dimens),
      // child: service_widget(),
    );
  }

  service_widget(Dimens dimens, String image, Function onClick) {
    return Column(
      children: [
        SvgPicture.asset(
          image,
          height: dimens.height40,
        ),
        GestureDetector(
          onTap: onClick(),
          child: UniversButton(
            text: 'Polis qoshish',
          ),
        )
      ],
    );
  }

  select_service(HomeBloc bloc) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Gap(dimens.paddingWidth),
          serviceitem(
            bloc,
            IConstanta.HOME_KASKO,
            Resource.NEW_IC_KACKO,
            AppStrings.kasko,
            AppColors.green_color,
          ),
          Gap(dimens.paddingWidth),
          serviceitem(
            bloc,
            IConstanta.HOME_OSAGO,
            Resource.NEW_IC_OSAGO,
            AppStrings.osago,
            AppColors.blue_top_color,
          ),
          Gap(dimens.paddingWidth),
          serviceitem(
            bloc,
            IConstanta.HOME_TRAVEL,
            Resource.NEW_IC_TRAVEL,
            AppStrings.travel,
            AppColors.black_top_color,
          ),
          Gap(dimens.paddingWidth),
          serviceitem(
            bloc,
            IConstanta.HOME_SERVICES,
            Resource.NEW_IC_SERVICES,
            AppStrings.additionalServices,
            AppColors.black_top_color,
          ),
          Gap(dimens.paddingWidth),
          serviceitem(
            bloc,
            IConstanta.HOME_GARANTY,
            Resource.NEW_IC_GARANTY_PLUS,
            AppStrings.warrantyCode,
            AppColors.black_top_color,
          ),
          Gap(dimens.paddingWidth),
        ],
      ),
    );
  }

  serviceitem(HomeBloc bloc, int categoryId, String icon, String label,
      Color activeColor) {
    final isSelected = bloc.policyCategoryId == categoryId;

    return GestureDetector(
      onTap: () => bloc.add(SelectPolicyCategoryEvent(categoryId)),
      child: Container(
        decoration: isSelected
            ? category_select_button_deco(dimens)
            : category_not_select_deco(dimens, bloc.policyCategoryId),
        padding: EdgeInsets.symmetric(
          horizontal: dimens.paddingWidth,
          vertical: dimens.paddingHeight / 2,
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              // color: Colors.black,
              color: isSelected ? activeColor : AppColors.white,
            ),
            Gap(dimens.width20),
            Text(
              label,
              style: dimens.textStyle.copyWith(
                fontWeight: FontWeight.w700,
                color: isSelected ? AppColors.text_color : AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
