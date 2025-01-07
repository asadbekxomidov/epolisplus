import 'package:epolisplus/utils/dimens.dart';
import 'package:flutter/cupertino.dart';
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
  static IconData addIconData = Icons.add;
  static IconData in_visibility = Icons.visibility_off;
  static IconData arrow_forward_outlined = Icons.arrow_forward_outlined;
  static IconData arrow_circle_left_outlined = Icons.arrow_circle_left_outlined;
  static IconData logoutIcon = Icons.logout;
  static IconData navigatenextIcon = Icons.navigate_next;
  static IconData keyboardarrowupIcon = Icons.keyboard_arrow_up;
  static IconData keyboardarrowdownIcon = Icons.keyboard_arrow_down;
  static IconData infocircleIcon = CupertinoIcons.info_circle;

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

  static String telegramIcon =
      "assets/images/settings/icons/telegram_icons.png";
  static String callOperatorIcon =
      "assets/images/settings/icons/call_operator.png";
  static String sosCallIcon = "assets/images/home/sos/sos_call_icon.png";
  static String sosTelegramIoon =
      "assets/images/home/sos/sos_telegram_icon.png";

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

  static String homeTabbarIcon =
      'assets/images/home/tapbar/home_green_icon.png';
  static String homeTabbarGreyIcon =
      'assets/images/home/tapbar/home_grey_icon.png';
  static String kabinetTabbarIcon =
      'assets/images/home/tapbar/kabinet_icon.png';
  static String kabinetTabbarGreenIcon =
      'assets/images/home/tapbar/kabinet_green_icon.png';
  static String sosTabbarIcon = 'assets/images/home/tapbar/sos_image.png';
  static String mypoliciesTabbarIcon =
      'assets/images/home/tapbar/my_policies_icon.png';
  static String mypoliciesTabbarGreenIcon =
      'assets/images/home/tapbar/my_policies_green.png';
  static String partnersTabbarIcon =
      'assets/images/home/tapbar/partners_icon.png';
  static String partnersTabbarGreenIcon =
      'assets/images/home/tapbar/partners_green_icon.png';

  // ! svg image

  static String ingoUzbSvg = 'assets/svg/ingo_uzb_image_scg.svg';
  static String capitalSugurtaSvg = 'assets/svg/capital_sugurta_image_svg.svg';
  static String epolisCardLogo = 'assets/images/epolis_card_logo.png';

  // ! partners
  static String partnersOsagoIcon =
      'assets/images/partners/images/osago_grey_icon.png';
  static String partnersKaskoIcon =
      'assets/images/partners/images/kasko_grey_icon.png';
  static String partnersTravelIcon =
      'assets/images/partners/images/travel_grey_icon.png';
  static String partnersCallOpercon =
      'assets/images/partners/images/call_opertator_icon.png';
  static String partnersVebSaytcon =
      'assets/images/partners/images/veb_sayt_icon.png';

  // ! kabinet
  static String cabinetEditIcon = 'assets/images/kabinet/icons/edit_icon.png';
  static String deleteEditIcon = 'assets/images/kabinet/icons/delete_icon.png';
  static String carNotIcon = 'assets/images/kabinet/icons/car_not_icon.png';
  static String addIcon = 'assets/images/kabinet/icons/add_icon.png';
  static String searchIcon = 'assets/images/search_icon.png';
  static String creditCardIcon = 'assets/images/card_icon.png';
  static String paswordCardImage = 'assets/images/password_card_image.png';
  static String uzbFlagIcon = 'assets/images/flag_uzb.png';
  static String activateWIcon = 'assets/images/activate_w_icon.png';
  static String codeIcon = 'assets/images/code_icon.png';
  static String noInternet = 'assets/images/no_internet.png';
  static String updateInternetIcon = 'assets/images/update_internet_icon.png';
  static String splashPoliciesIcon = 'assets/images/splash_policies_icon.png';
  static String loadingPageLogo = 'assets/images/loading_page_logo.png';
}
