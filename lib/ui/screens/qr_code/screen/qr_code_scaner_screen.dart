import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/ui/screens/qr_code/bloc/qr_code_bloc.dart';

class QrCodeScanerScreen extends StatefulWidget {
  @override
  State<QrCodeScanerScreen> createState() => _QrCodeScanerScreenState();
}

class _QrCodeScanerScreenState extends State<QrCodeScanerScreen> {
  late Dimens dimens;

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) => QrCodeBloc()..add(QrCodeInitializeEvent()),
      child: Scaffold(
        body: BlocConsumer<QrCodeBloc, QrCodeState>(
          listener: (context, state) {
            if (state is QrCodeErrorState) {
              showErrorMessageSnackBar(context, state.error);
            }
            // if (state is QrCodeScannedSuccessState) {
            //   showSuccessMessageSnackBar(context, "Scanned: ${state.data}");
            // }
          },
          builder: (context, state) {
            final bloc = BlocProvider.of<QrCodeBloc>(context);

            return Container(
              height: dimens.screenHeight,
              decoration: mainDecorations(),
              width: dimens.screenWidth,
              // padding: EdgeInsets.symmetric(
              //   horizontal: dimens.paddingHorizontal16,
              // ),
              child: Column(
                children: [
                  Gap(dimens.paddingVerticalItem59),
                  Row(
                    children: [
                      Gap(dimens.paddingHorizontal16),
                      ButtonPagesBtn(
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
                          Container(
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
                                Positioned(
                                  bottom: 20,
                                  child: Text(
                                    'Scan a QR code',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
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
        ),
      ),
    );
  }

  @override
  void reassemble() {
    super.reassemble();
    context.read<QrCodeBloc>().add(QrCodePauseEvent());
    context.read<QrCodeBloc>().add(QrCodeResumeEvent());
  }

  @override
  void dispose() {
    context.read<QrCodeBloc>().add(QrCodeDisposeEvent());
    super.dispose();
  }
}
