import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:epolisplus/ui/screens/tabbar/bloc/tabbar_bloc.dart';

class BottomWidget extends StatefulWidget {
  const BottomWidget({super.key});

  @override
  State<BottomWidget> createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<BottomWidget> {
  late TabbarBloc bloc;
  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) => TabbarBloc(),
      child: BlocConsumer<TabbarBloc, TabbarState>(
        listener: (context, state) {},
        builder: (context, state) {
          bloc = BlocProvider.of<TabbarBloc>(context);
          return Scaffold(
            body: getBody(state),
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                bloc.add(TabSelectedEvent(index));
              },
              selectedLabelStyle: dimens.tabbarTextSty,
              unselectedLabelStyle: dimens.tabbarSelectTextSty,
              currentIndex: bloc.currentIndex,
              backgroundColor: AppColors.whiteColor,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    AppImage.homeTabbarGreyIcon,
                    height: dimens.height24,
                  ),
                  activeIcon: Image.asset(
                    AppImage.homeTabbarIcon,
                    height: dimens.height24,
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    AppImage.kabinetTabbarIcon,
                    height: dimens.height24,
                  ),
                  activeIcon: Image.asset(
                    AppImage.kabinetTabbarGreenIcon,
                    height: dimens.height24,
                  ),
                  label: "Kabinet",
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    AppImage.sosTabbarIcon,
                    height: dimens.height68,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    AppImage.mypoliciesTabbarIcon,
                    height: dimens.height24,
                  ),
                  activeIcon: Image.asset(
                    AppImage.mypoliciesTabbarGreenIcon,
                    height: dimens.height24,
                  ),
                  label: "Policies",
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    AppImage.partnersTabbarIcon,
                    height: dimens.height24,
                  ),
                  activeIcon: Image.asset(
                    AppImage.partnersTabbarGreenIcon,
                    height: dimens.height24,
                  ),
                  label: "Partners",
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  getBody(TabbarState state) {
    return state is HomeState2
        ? HomeScreen()
        : state is CabinetState
            ? CabinetScreen()
            : state is SosState
                ? HomeScreen()
                : state is PolicyState
                    ? PoliciesScreen()
                    : state is PartnerState
                        ? PartnersScreen()
                        : HomeScreen();
  }
}
