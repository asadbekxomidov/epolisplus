import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:epolisplus/ui/screens/qr_code/bloc/qr_code_bloc.dart';

class QrCodeScanerScreen extends StatefulWidget {
  QRViewController? controller;
  @override
  State<QrCodeScanerScreen> createState() => _QrCodeScanerScreenState();
}

class _QrCodeScanerScreenState extends State<QrCodeScanerScreen> {
  late Dimens dimens;
  late QrCodeBloc bloc;

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) => QrCodeBloc()..add(QrCodeInitializeEvent()),
      child: Scaffold(
        backgroundColor: AppColors.blackColor,
        body: SafeArea(
          child: Stack(
            children: [
              ui(),
            ],
          ),
        ),
      ),
    );
  }

  ui() {
    return BlocConsumer<QrCodeBloc, QrCodeState>(
      listener: (context, state) {
        if (state is QrCodeErrorState) {
          showErrorMessageSnackBar(
            context,
            state.failure.getErrorMessage(context),
          );
        }
      },
      builder: (context, state) {
        bloc = BlocProvider.of<QrCodeBloc>(context);

        return Container(
          height: dimens.screenHeight,
          width: dimens.screenWidth,
          decoration: backgroundPagesDecorations(dimens),
          child: Column(
            children: [
              Gap(dimens.paddingVerticalItem10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ContainerGreyWidget(),
                ],
              ),
              Gap(dimens.paddingVerticalItem26),
              Row(
                children: [
                  Gap(dimens.paddingHorizontal16),
                  NaviGatePopButton(
                    onClick: () {
                      Get.back();
                    },
                    appColors: AppColors.mainColor,
                    iconData: Icons.close,
                    text: AppStrings.closeText,
                  ),
                ],
              ),
              Gap(dimens.paddingVerticalItem8),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        width: dimens.screenWidth,
                        height: dimens.screenHeight,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            QRView(
                              key: qrKey,
                              onQRViewCreated: (controller) {
                                bloc.setController(controller);
                              },
                              overlay: QrScannerOverlayShape(
                                borderColor: Colors.white,
                                borderRadius: 10,
                                borderLength: 30,
                                borderWidth: 10,
                                cutOutSize: dimens.screenWidth * 0.8,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
