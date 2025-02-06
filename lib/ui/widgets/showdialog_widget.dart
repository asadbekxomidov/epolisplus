import 'dart:ui';

import 'package:epolisplus/models/models_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
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
                    Container(
                      height: dimens.height68,
                      width: dimens.height68,
                      decoration: BoxDecoration(
                          color: AppColors.redColorFill,
                          borderRadius: BorderRadius.circular(
                            dimens.radius50,
                          ),
                          border: Border.all(
                            color: AppColors.borderRedColor,
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            AppImage.deleteRedIcon,
                            height: dimens.height36,
                          ),
                        ],
                      ),
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
                    GestureDetector(
                      onTap: () {
                        if (onClick != null) {
                          onClick!();
                        }
                        Navigator.of(context).pop();
                      },
                      child: RedButton(
                        image: AppImage.whiteDeleteIcon,
                        text: AppStrings.closeText,
                      ),
                    ),
                    Gap(dimens.paddingVerticalItem8),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: WhiteBtn(
                        text: AppStrings.cancelText,
                      ),
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

// ? WarrantyCodePartnersDialog

class MyShowWarrantCodeScreenDilog extends StatelessWidget {
  final Function(String) onSelectPartner;
  final List<ActivateCodePartnersResponse> partners;

  const MyShowWarrantCodeScreenDilog({
    required this.partners,
    required this.onSelectPartner,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Agar faqat bitta partner bo'lsa, uni avtomatik tanlash
    final ValueNotifier<String> selectedPartnerName = ValueNotifier<String>(
      partners.isNotEmpty ? partners.first.partner_name : "",
    );

    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: DraggableScrollableSheet(
        initialChildSize: 0.4,
        minChildSize: 0.3,
        maxChildSize: 0.7,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 4,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Hamkorlarimiz haqida ma'lumot",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 12),
                  partners.isNotEmpty
                      ? Expanded(
                          child: ValueListenableBuilder<String>(
                            valueListenable: selectedPartnerName,
                            builder: (context, selectedName, _) {
                              return ListView.builder(
                                controller: scrollController,
                                itemCount: partners.length,
                                itemBuilder: (context, index) {
                                  var partner = partners[index];
                                  return ListTile(
                                    title: Text(partner.partner_name),
                                    trailing: Icon(
                                      selectedName == partner.partner_name
                                          ? Icons.check_circle
                                          : Icons.circle_outlined,
                                      color:
                                          selectedName == partner.partner_name
                                              ? Colors.green
                                              : Colors.grey,
                                    ),
                                    onTap: () {
                                      selectedPartnerName.value =
                                          partner.partner_name;
                                      onSelectPartner(partner.partner_name);
                                      Navigator.pop(context); // Dialogni yopish
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        )
                      : const Text('Hamkorlar mavjud emas'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
