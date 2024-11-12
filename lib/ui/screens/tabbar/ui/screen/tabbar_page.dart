import 'package:epolisplus/ui/screens/tabbar/bloc/tabbar_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class TabbarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dimens = Dimens(context);

    return BlocProvider(
      create: (context) => TabbarBloc(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: dimens.paddingHorizontal4),
        color: AppColors.whiteColor,
        height: dimens.height78,
        child: BlocBuilder<TabbarBloc, TabbarState>(
          builder: (context, state) {
            int selectedIndex = 0;
            if (state is TabbarSelectionUpdated) {
              selectedIndex = state.selectedIndex;
            } else if (state is TabbarInitialState) {
              selectedIndex = state.initialIndex;
            }

            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildTabItem(
                  context: context,
                  icon: AppImage.homegreyIcon,
                  label: 'Home',
                  index: 0,
                  dimens: dimens,
                  isSelected: selectedIndex == 0,
                ),
                buildTabItem(
                  context: context,
                  icon: AppImage.kabinetIcon,
                  label: 'Kabinet',
                  index: 1,
                  dimens: dimens,
                  isSelected: selectedIndex == 1,
                ),
                buildTabItem(
                  context: context,
                  icon: AppImage.sosIcon,
                  index: 2,
                  dimens: dimens,
                  iconHeight: dimens.height60,
                  isSelected: selectedIndex == 2,
                ),
                buildTabItem(
                  context: context,
                  icon: AppImage.mypoliciesIcon,
                  label: 'Policies',
                  index: 3,
                  dimens: dimens,
                  isSelected: selectedIndex == 3,
                ),
                buildTabItem(
                  context: context,
                  icon: AppImage.partnersIcon,
                  label: 'Partners',
                  index: 4,
                  dimens: dimens,
                  isSelected: selectedIndex == 4,
                ),
              ],
            );
          },
        ),
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
  }) {
    return GestureDetector(
      onTap: () {
        final bloc = context.read<TabbarBloc>();
        bloc.add(TabSelected(index));
        bloc.add(TabScreenPushEvent(index));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: dimens.paddingHorizontal8),
        width: dimens.height60,
        height: dimens.height78,
        decoration: BoxDecoration(color: Colors.transparent),
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
              Gap(dimens.height4),
              Text(
                label,
                style: TextStyle(
                  fontSize: dimens.font12,
                  color: isSelected ? AppColors.mainColor : AppColors.greyColor,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
