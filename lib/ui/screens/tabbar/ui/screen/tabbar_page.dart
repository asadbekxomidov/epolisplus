import 'package:epolisplus/ui/screens/tabbar/bloc/tabbar_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabbarPage extends StatefulWidget {
  TabbarPage({super.key});

  @override
  State<TabbarPage> createState() => _TabbarPageState();
}

class _TabbarPageState extends State<TabbarPage> {
  late Dimens dimens;
  late TabbarBloc tabbarBloc;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) => TabbarBloc(),
      child: BlocConsumer<TabbarBloc, TabbarState>(
        listener: (context, state) {},
        builder: (context, state) {
          tabbarBloc = BlocProvider.of<TabbarBloc>(context);
          int selectedIndex = 0;
          if (state is TabbarSelectionUpdated) {
            selectedIndex = state.selectedIndex;
          }
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: dimens.paddingHorizontal4,
            ),
            color: AppColors.whiteColor,
            height: dimens.height78,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildTabItem(
                  onclick: () {
                    tabbarBloc.add(HomeScreenPushEvent());
                  },
                  context: context,
                  icon: AppImage.homegreyIcon,
                  label: 'Home',
                  index: 0,
                  dimens: dimens,
                  isSelected: selectedIndex == 0,
                ),
                buildTabItem(
                  onclick: () {
                    tabbarBloc.add(KabinetScreenPushEvent());
                  },
                  context: context,
                  icon: AppImage.kabinetIcon,
                  label: 'Kabinet',
                  index: 1,
                  dimens: dimens,
                  isSelected: selectedIndex == 1,
                ),
                buildTabItem(
                  onclick: () {
                    tabbarBloc.add(SosScreenPushEvent());
                  },
                  context: context,
                  icon: AppImage.sosIcon,
                  index: 2,
                  dimens: dimens,
                  iconHeight: dimens.height60,
                  isSelected: selectedIndex == 2,
                ),
                buildTabItem(
                  onclick: () {
                    tabbarBloc.add(PoliciesScreenPushEvent());
                  },
                  context: context,
                  icon: AppImage.mypoliciesIcon,
                  label: 'Policies',
                  index: 3,
                  dimens: dimens,
                  isSelected: selectedIndex == 3,
                ),
                buildTabItem(
                  onclick: () {
                    tabbarBloc.add(PartnersScreenPushEvent());
                  },
                  context: context,
                  icon: AppImage.partnersIcon,
                  label: 'Partners',
                  index: 4,
                  dimens: dimens,
                  isSelected: selectedIndex == 4,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildTabItem({
    required BuildContext context,
    required String icon,
    String? label,
    required int index,
    required Dimens dimens,
    double? iconHeight,
    required bool isSelected,
    Function? onclick,
  }) {
    return GestureDetector(
      onTap: () {
        onclick!();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: dimens.paddingHorizontal8,
        ),
        width: dimens.height60,
        height: dimens.height78,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: iconHeight ?? dimens.height24,
              width: iconHeight ?? dimens.height24,
              child: Image.asset(
                icon,
                fit: BoxFit.contain,
                color: label != null
                    ? (isSelected ? AppColors.mainColor : AppColors.greyColor)
                    : null,
              ),
            ),
            if (label != null) ...[
              Text(
                label,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: dimens.font12,
                  color: isSelected ? AppColors.mainColor : AppColors.greyColor,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
