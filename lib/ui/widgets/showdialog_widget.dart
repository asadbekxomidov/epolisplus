import 'dart:ui';

import 'package:epolisplus/models/models_export.dart';
import 'package:epolisplus/ui/widgets/my_widget.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
// import 'package:gap/gap.dart';

class ShowdialogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Emergency SOS'),
      content: Text('Would you like to activate the emergency SOS service?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Activate'),
        ),
      ],
    );
  }
}

// ? WarrantyCodePartnersDialog

class MyShowWarrantCodeScreenDilog extends StatelessWidget {
  final Function onClick;
  late Dimens dimens;
  final List<ActivateCodePartnersResponse> partners;

  MyShowWarrantCodeScreenDilog({
    required this.partners,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);
    return GestureDetector(
      onTap: () {
        onClick();
      },
      child: DraggableScrollableSheet(
        initialChildSize: 0.4,
        minChildSize: 0.3,
        maxChildSize: 0.7,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            decoration: BoxDecoration(
              color: AppColors.whiteColor255,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(
                  dimens.radius16,
                ),
              ),
            ),
            child: GestureDetector(
              onTap: () {
                onClick();
              },
              child: SingleChildScrollView(
                controller: scrollController,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 40,
                          height: 5,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Text(
                        "Hamkorlarimiz haqida ma'lumot",
                        style: dimens.font16Blackw400Sty,
                      ),
                      partners.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              itemCount: partners.length,
                              itemBuilder: (context, index) {
                                var partner = partners[index];
                                return ListTile(
                                  onTap: () {
                                    print(
                                        "Tanlangan Partner: ${partner.partner_name}");
                                  },
                                  title: Text(partner.partner_name),
                                  subtitle:
                                      Text("Partner ID: ${partner.partner_id}"),
                                );
                              },
                            )
                          : Text('Hamkorlar mavjud emas'),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ? DeleteAccountShowDialog

class DeleteAccountShowDialog extends StatelessWidget {
  final Function? onClick;

  DeleteAccountShowDialog({this.onClick});

  @override
  Widget build(BuildContext context) {
    final dimens = Dimens(context);

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5.0,
              sigmaY: 5.0,
            ),
            child: Container(
              height: dimens.screenHeight,
              width: dimens.screenWidth,
              color: AppColors.backgroundBlurColor0,
              // color: Colors.black.withOpacity(0.5),
            ),
          ),
          Center(
            child: Container(
              height: dimens.height332,
              width: dimens.width313,
              padding: EdgeInsets.all(
                dimens.height16,
              ),
              decoration: myCardPagesDecorations(dimens),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MyContainerRowImageWidget(
                      mainAxisAlig: MainAxisAlignment.center,
                      onclick: () {},
                      height: dimens.height68,
                      width: dimens.height68,
                      iconData: AppImage.deleteRedIcon,
                      style: dimens.font16Blackw400Sty,
                      iconSize: dimens.height36,
                      color: AppColors.redColorFill,
                      myRadius: dimens.radius50,
                      borderColor: AppColors.borderRedColor,
                    ),
                    Gap(dimens.paddingVerticalItem12),
                    Text(
                      AppStrings.deleteYourAccount,
                      style: dimens.font20Blackw600Sty,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: dimens.paddingVerticalItem2),
                    Text(
                      AppStrings.actioncannotbeUndone,
                      style: dimens.font14Greyw400Sty,
                      textAlign: TextAlign.center,
                    ),
                    Gap(dimens.paddingVerticalItem16),
                    MyContainerRowImageWidget(
                      style: dimens.font16Whitew600Sty,
                      width: dimens.width265,
                      height: dimens.height40,
                      image: AppImage.whiteDeleteIcon,
                      iconSize: dimens.height20,
                      color: AppColors.redColordefault,
                      borderColor: AppColors.redColordefault,
                      mainAxisAlig: MainAxisAlignment.center,
                      myRadius: dimens.radius12,
                      onclick: () {
                        if (onClick != null) {
                          onClick!();
                        }
                        Navigator.of(context).pop();
                      },
                      text: AppStrings.closeText,
                      centerPadding: dimens.paddingHorizontal8,
                    ),
                    Gap(dimens.paddingVerticalItem8),
                    MyContainerRowImageWidget(
                      style: dimens.font16Blackw400Sty,
                      width: dimens.width265,
                      height: dimens.height40,
                      color: AppColors.whiteColor255,
                      borderColor: AppColors.greyColor239,
                      mainAxisAlig: MainAxisAlignment.center,
                      myRadius: dimens.radius12,
                      onclick: () {
                        Navigator.of(context).pop();
                      },
                      text: AppStrings.cancelText,
                      padding: dimens.paddingHorizontal4,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
