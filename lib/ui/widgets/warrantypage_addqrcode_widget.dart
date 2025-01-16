// import 'package:gap/gap.dart';
// import 'package:flutter/material.dart';
// import 'package:epolisplus/utils/utils_export.dart';
// import 'package:epolisplus/ui/widgets/widgets_export.dart';
// import 'package:epolisplus/ui/screens/warrantycode/bloc/warrantycode_bloc.dart';

// class WarrantyAddQrCodeWidget extends StatelessWidget {
//   late Dimens dimens;
//   late WarrantycodeBloc bloc;

//   @override
//   Widget build(BuildContext context) {
//     dimens = Dimens(context);

//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.end,
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               AppStrings.warrantyCodeText,
//               style: dimens.font14Greyw400Sty,
//             ),
//             Gap(dimens.paddingVerticalItem2),
//             MyTextfieldWCode(
//               controller: bloc.qrCodeController,
//               myRadius: dimens.radius12,
//               height: dimens.height40,
//               width: bloc.isHaveQrCodeInfo ? dimens.width150 : dimens.width202,
//               // width: dimens.width202,
//               style: dimens.font16Blackw400Sty,
//               text: AppStrings.searchText,
//               hintstyle: dimens.hintStyle,
//               iconData: bloc.isHaveQrCodeInfo,
//               isActive: !bloc.isHaveQrCodeInfo,
//             ),
//           ],
//         ),
//         bloc.isHaveQrCodeInfo
//             ? MyContainerRowImageWidget(
//                 mainAxisAlig: MainAxisAlignment.spaceAround,
//                 onclick: () {
//                   showModalBottomSheet(
//                     context: context,
//                     isScrollControlled: true,
//                     backgroundColor: Colors.transparent,
//                     builder: (context) {
//                       return MyShowWarrantCodeScreenDilog();
//                     },
//                   );
//                 },
//                 text: 'test',
//                 height: dimens.height40,
//                 width:
//                     bloc.isHaveQrCodeInfo ? dimens.width150 : dimens.width100,
//                 iconData: AppImage.selectIcon,
//                 style: dimens.font16Blackw400Sty,
//                 iconSize: dimens.height20,
//                 color: AppColors.blackColor,
//                 myRadius: dimens.radius12,
//               )
//             : MyContainerRowPWidget(
//                 paddingContainer: 1,
//                 mainAxisAlig: MainAxisAlignment.center,
//                 onclick: () {},
//                 padding: dimens.paddingHorizontal4,
//                 text: AppStrings.searchText,
//                 height: dimens.height40,
//                 width: dimens.width100,
//                 iconData: Icons.search,
//                 style: dimens.font16Blackw400Sty,
//                 iconSize: dimens.height20,
//                 color: AppColors.blackColor,
//                 myRadius: dimens.radius12,
//               ),
//         bloc.isHaveQrCodeInfo
//             ? MyContainerRowImageWidget(
//                 mainAxisAlig: MainAxisAlignment.center,
//                 onclick: () {
//                   bloc.add(WarrantycodeQrCodeClearEvent());
//                 },
//                 height: dimens.height40,
//                 width: dimens.width40,
//                 iconData: AppImage.deleteEditIcon,
//                 style: dimens.font16Blackw400Sty,
//                 iconSize: dimens.height20,
//                 color: AppColors.blackColor,
//                 myRadius: dimens.radius50,
//               )
//             : MyContainerRowImageWidget(
//                 mainAxisAlig: MainAxisAlignment.center,
//                 onclick: () {
//                   bloc.add(WarrantycodePushScreenEvent());
//                 },
//                 height: dimens.height40,
//                 width: dimens.width40,
//                 iconData: AppImage.codeIcon,
//                 style: dimens.font16Blackw400Sty,
//                 iconSize: dimens.height20,
//                 color: AppColors.blackColor,
//                 myRadius: dimens.radius50,
//               ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/ui/screens/warrantycode/bloc/warrantycode_bloc.dart';

class WarrantyAddQrCodeWidget extends StatelessWidget {
  // final Dimens dimens;
  final WarrantycodeBloc bloc;

  WarrantyAddQrCodeWidget({
    Key? key,
    // required this.dimens,
    required this.bloc,
  }) : super(key: key);

  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.warrantyCodeText,
              style: dimens.font14Greyw400Sty,
            ),
            Gap(dimens.paddingVerticalItem2),
            MyTextfieldWCode(
              controller: bloc.qrCodeController,
              myRadius: dimens.radius12,
              height: dimens.height40,
              width: bloc.isHaveQrCodeInfo ? dimens.width150 : dimens.width202,
              style: dimens.font16Blackw400Sty,
              text: AppStrings.searchText,
              hintstyle: dimens.hintStyle,
              iconData: bloc.isHaveQrCodeInfo,
              isActive: !bloc.isHaveQrCodeInfo,
            ),
          ],
        ),
        bloc.isHaveQrCodeInfo
            ? MyContainerRowImageWidget(
                mainAxisAlig: MainAxisAlignment.spaceAround,
                onclick: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) {
                      return MyShowWarrantCodeScreenDilog();
                    },
                  );
                },
                text: 'test',
                height: dimens.height40,
                width:
                    bloc.isHaveQrCodeInfo ? dimens.width150 : dimens.width100,
                iconData: AppImage.selectIcon,
                style: dimens.font16Blackw400Sty,
                iconSize: dimens.height20,
                color: AppColors.blackColor,
                myRadius: dimens.radius12,
              )
            : MyContainerRowPWidget(
                paddingContainer: 1,
                mainAxisAlig: MainAxisAlignment.center,
                onclick: () {},
                padding: dimens.paddingHorizontal4,
                text: AppStrings.searchText,
                height: dimens.height40,
                width: dimens.width100,
                iconData: Icons.search,
                style: dimens.font16Blackw400Sty,
                iconSize: dimens.height20,
                color: AppColors.blackColor,
                myRadius: dimens.radius12,
              ),
        bloc.isHaveQrCodeInfo
            ? MyContainerRowImageWidget(
                mainAxisAlig: MainAxisAlignment.center,
                onclick: () {
                  bloc.add(WarrantycodeQrCodeClearEvent());
                },
                height: dimens.height40,
                width: dimens.width40,
                iconData: AppImage.deleteEditIcon,
                style: dimens.font16Blackw400Sty,
                iconSize: dimens.height20,
                color: AppColors.blackColor,
                myRadius: dimens.radius50,
              )
            : MyContainerRowImageWidget(
                mainAxisAlig: MainAxisAlignment.center,
                onclick: () {
                  bloc.add(WarrantycodePushScreenEvent());
                },
                height: dimens.height40,
                width: dimens.width40,
                iconData: AppImage.codeIcon,
                style: dimens.font16Blackw400Sty,
                iconSize: dimens.height20,
                color: AppColors.blackColor,
                myRadius: dimens.radius50,
              ),
      ],
    );
  }
}
