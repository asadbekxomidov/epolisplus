import 'package:epolisplus/utils/dimens.dart';
import 'package:flutter/material.dart';

class AppImage {
  static String appMainImage = 'assets/images/main_image.png';
  static String appImageLogo = 'assets/images/logo.png';
  static String splashImage = 'assets/images/splash_image.png';
  static String personIcon = 'assets/images/person_image.png';
  static String settingsIcon = 'assets/images/settings_image.png';
  static String shieldPlusIcon = 'assets/images/shield_plus_image.png';
  static String notificationIcon = 'assets/images/notification_image.png';

  // ? home_screen_image

  static String homeBlueImage = 'assets/images/home/blue_image.png';
  static String homeGreenImage = 'assets/images/home/green_image.png';
  static String homeRedImage = 'assets/images/home/red_image.png';
  static String kaskoImage = 'assets/images/home/kasko_image.png';
  static String osagoImage = 'assets/images/home/osago_image.png';
  static String travelImage = 'assets/images/home/travel_image.png';

  // ? home_screen icons
  static String additional_services_icon =
      'assets/icons/additional_services_icon.png';
  static String kasko_icon = 'assets/icons/kasko_icon.png';
  static String osago_icon = 'assets/icons/osago_icon.png';
  static String travel_icon = 'assets/icons/travel_icon.png';
  static String warranty_code_icon = 'assets/icons/warranty_code_icon.png';

  static String travelHomeIcon = 'assets/images/home/icons/travel_icon.png';
  static String kaskolHomeIcon = 'assets/images/home/icons/kasko_icon.png';
  static String osagoHomeIcon = 'assets/images/home/icons/osago_icon.png';
  static String settingslogoutIcon = 'assets/images/home/icons/logout_icon.png';
  static String warrantyHomeIcon =
      'assets/images/home/icons/warranty_code_icon.png';
  static String emergencyservicesIcon =
      'assets/images/home/icons/emergency_services_icon.png';

  static IconData visibility = Icons.visibility;
  static IconData in_visibility = Icons.visibility_off;
  static IconData arrow_forward_outlined = Icons.arrow_forward_outlined;
  static IconData arrow_circle_left_outlined = Icons.arrow_circle_left_outlined;
  static IconData logoutIcon = Icons.logout;
  static IconData navigatenextIcon = Icons.navigate_next;

  // ! HomeIcon

  static IconData arrowcirclerightIcon = Icons.arrow_circle_right_outlined;

  // ! Settings

  static String notificationSettingIcon =
      'assets/images/home/icons/notification_icon.png';
  static String languageSettingIcon =
      'assets/images/home/icons/language_icon.png';
  static String helpdeskSettingIcon =
      'assets/images/home/icons/helpdesk_icon.png';
  static String questionsanswerSettingIcon =
      'assets/images/home/icons/questionsanswer_icon.png';
  static String aboutapplicationSettingIcon =
      'assets/images/home/icons/aboutapplication_icon.png';

  static Widget starWidget(BuildContext context) {
    return Text(
      "*",
      style: Dimens(context).starliteStyle,
    );
    // return Row(
    //   children: [
    //     Gap(Dimens(context).paddingHorizontalItem),
    //     Icon(
    //       Icons.star_border_purple500_outlined,
    //       color: AppColors.redColor,
    //     ),
    //   ],
    // );
  }

  // ! Home TapBar image

  static String homeIcon = 'assets/images/home/tapbar/home_icon.png';
  static String kabinetIcon = 'assets/images/home/tapbar/kabinet_icon.png';
  static String sosIcon = 'assets/images/home/tapbar/sos_image.png';
  static String mypoliciesIcon =
      'assets/images/home/tapbar/my_policies_icon.png';
  static String partnersIcon = 'assets/images/home/tapbar/partners_icon.png';
  static String homegreyIcon = 'assets/images/home/tapbar/home_grey_icon.png';
}
