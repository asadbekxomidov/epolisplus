import 'package:epolisplus/utils/dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppImage {
  static String appMainImage = 'assets/image/main_image.png';
  static String new_back_image2 = 'assets/image/new_back_image2.png';
  static String appImageLogo = 'assets/image/logo.png';
  static String splashImage = 'assets/image/splash_image.png';
  static String personIcon = 'assets/image/person_image.png';
  static String settingsIcon = 'assets/image/settings_image.png';
  static String shieldPlusIcon = 'assets/image/shield_plus_image.png';
  static String notificationIcon = 'assets/image/notification_image.png';

  // ? home_screen_image

  static String homeBlueImage = 'assets/image/home/blue_image.png';
  static String homeGreenImage = 'assets/image/home/green_image.png';
  static String homeRedImage = 'assets/image/home/red_image.png';
  static String kaskoImage = 'assets/image/home/kasko_image.png';
  static String osagoImage = 'assets/image/home/osago_image.png';
  static String travelImage = 'assets/image/home/travel_image.png';
  static String serviseDecimage = 'assets/image/home/servise_decimage.png';
  static String guarantDecimage = 'assets/image/home/guarant_image.png';

  static String guarantIcon = 'assets/image/home/guarant_icon.png';
  static String serviseIcon = 'assets/image/home/servise_icon.png';

  // ? home_screen icons
  static String additional_services_icon =
      'assets/icons/additional_services_icon.png';
  static String kasko_icon = 'assets/icons/kasko_icon.png';
  static String osago_icon = 'assets/icons/osago_icon.png';
  static String travel_icon = 'assets/icons/travel_icon.png';
  static String warranty_code_icon = 'assets/icons/warranty_code_icon.png';

  static String travelHomeIcon = 'assets/image/home/icons/travel_icon.png';
  static String kaskolHomeIcon = 'assets/image/home/icons/kasko_icon.png';
  static String osagoHomeIcon = 'assets/image/home/icons/osago_icon.png';
  static String settingslogoutIcon = 'assets/image/home/icons/logout_icon.png';
  static String warrantyHomeIcon =
      'assets/image/home/icons/warranty_code_icon.png';
  static String emergencyservicesIcon =
      'assets/image/home/icons/emergency_services_icon.png';

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
      'assets/image/home/icons/notification_icon.png';
  static String languageSettingIcon =
      'assets/image/home/icons/language_icon.png';
  static String helpdeskSettingIcon =
      'assets/image/home/icons/helpdesk_icon.png';
  static String questionsanswerSettingIcon =
      'assets/image/home/icons/questionsanswer_icon.png';
  static String aboutapplicationSettingIcon =
      'assets/image/home/icons/aboutapplication_icon.png';

  static String telegramIcon =
      "assets/image/settings/icons/telegram_icons.png";
  static String callOperatorIcon =
      "assets/image/settings/icons/call_operator.png";
  static String sosCallIcon = "assets/image/home/sos/sos_call_icon.png";
  static String sosTelegramIoon =
      "assets/image/home/sos/sos_telegram_icon.png";

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

  static Widget iconWidget(BuildContext context) {
    return Image.asset(
      AppImage.warrantycodewidgeticon,
      height: Dimens(context).height18,
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
      'assets/image/home/tapbar/home_green_icon.png';
  static String homeTabbarGreyIcon =
      'assets/image/home/tapbar/home_grey_icon.png';
  static String kabinetTabbarIcon =
      'assets/image/home/tapbar/kabinet_icon.png';
  static String kabinetTabbarGreenIcon =
      'assets/image/home/tapbar/kabinet_green_icon.png';
  static String sosTabbarIcon = 'assets/image/home/tapbar/sos_image.png';
  static String mypoliciesTabbarIcon =
      'assets/image/home/tapbar/my_policies_icon.png';
  static String mypoliciesTabbarGreenIcon =
      'assets/image/home/tapbar/my_policies_green.png';
  static String partnersTabbarIcon =
      'assets/image/home/tapbar/partners_icon.png';
  static String partnersTabbarGreenIcon =
      'assets/image/home/tapbar/partners_green_icon.png';

  // ! svg image

  static String ingoUzbSvg = 'assets/svg/ingo_uzb_image_scg.svg';
  static String capitalSugurtaSvg = 'assets/svg/capital_sugurta_image_svg.svg';
  static String epolisCardLogo = 'assets/image/epolis_card_logo.png';

  // ! partners
  static String partnersOsagoIcon =
      'assets/image/partners/images/osago_grey_icon.png';
  static String partnersKaskoIcon =
      'assets/image/partners/images/kasko_grey_icon.png';
  static String partnersTravelIcon =
      'assets/image/partners/images/travel_grey_icon.png';
  static String partnersCallOpercon =
      'assets/image/partners/images/call_opertator_icon.png';
  static String partnersVebSaytcon =
      'assets/image/partners/images/veb_sayt_icon.png';

  // ! kabinet
  static String cabinetEditIcon = 'assets/image/kabinet/icons/edit_icon.png';
  static String deleteEditIcon = 'assets/image/kabinet/icons/delete_icon.png';
  static String carNotIcon = 'assets/image/kabinet/icons/car_not_icon.png';
  static String addIcon = 'assets/image/kabinet/icons/add_icon.png';
  static String searchIcon = 'assets/image/search_icon.png';
  static String creditCardIcon = 'assets/image/card_icon.png';
  static String paswordCardImage = 'assets/image/password_card_image.png';
  static String uzbFlagIcon = 'assets/image/flag_uzb.png';
  static String activateWIcon = 'assets/image/activate_w_icon.png';
  static String codeIcon = 'assets/image/code_icon.png';
  static String noInternet = 'assets/image/no_internet.png';
  static String updateInternetIcon = 'assets/image/update_internet_icon.png';
  static String splashPoliciesIcon = 'assets/image/splash_policies_icon.png';
  static String loadingPageLogo = 'assets/image/loading_page_logo.png';
  static String closeIcon = 'assets/image/close_icon.png';
  static String selectIcon = 'assets/image/select_icon.png';
  static String deleteRedIcon = 'assets/image/delete_icon.png';
  static String whiteDeleteIcon = 'assets/image/white_delete_icon.png';
  static String cartiresIcon = 'assets/image/car_tires_icon.png';
  static String cartiresgreyIcon = 'assets/image/car_tires_grey_icon.png';
  static String phoneGreyIcon = 'assets/image/phone_grey_icon.png';
  static String phoneIcon = 'assets/image/phone_icon.png';
  static String fridgeIcon = 'assets/image/fridge_icon.png';
  static String refrigeratorgreyIcon = 'assets/image/refrigerator_grey_icon.png';
  static String amoutCoinIcon = 'assets/image/amout_pint_icon.png';
  static String containerWid = 'assets/image/container_images.png';
  static String isCheckcontainerWid = 'assets/image/container_images_ischeck.png';
  static String warrantycodewidgeticon =
      'assets/image/warrantycode_widget_icon.png';

  // ?  Gift

  static String progressBarGif = 'assets/gifs/progressbar.gif';
  static String newLineImage = 'assets/image/new_line_image.png';
  static String checksIcon = 'assets/icons/checks_icon.png';
  static String carIcon = 'assets/icons/car_icon.png';
}
