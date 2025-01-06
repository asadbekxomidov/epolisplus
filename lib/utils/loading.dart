import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final bool isLoading;
  const LoadingIndicator({
    Key? key,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dimens2 = Dimens(context);
    return isLoading ? progressBar2(dimens2) : Container();
  }
}

// class LoadingPages extends StatelessWidget {
//   late Dimens dimens;

//   @override
//   Widget build(BuildContext context) {
//     dimens = Dimens(context);

//     return Dialog(
//       backgroundColor: AppColors.dialogsColor,
//       // insetPadding: EdgeInsets.zero,
//       child: Stack(
//         children: [
//           Column(
//             // mainAxisSize: MainAxisSize.max,
//             // crossAxisAlignment: CrossAxisAlignment.center,
//             // mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset(
//                 AppImage.loadingPageLogo,
//                 height: dimens.height60,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

class LoadingPages extends StatelessWidget {
  late Dimens dimens;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Stack(
      children: [
        Container(
          height: dimens.screenHeight,
          width: dimens.screenWidth,
          decoration: myContainerLodingDEcorations(
            dimens,
            AppColors.backgroundBlurColor0,
          ),
          child: Center(
            child: Image.asset(
              AppImage.loadingPageLogo,
              height: dimens.height60,
            ),
          ),
        ),
      ],
    );
  }
}
