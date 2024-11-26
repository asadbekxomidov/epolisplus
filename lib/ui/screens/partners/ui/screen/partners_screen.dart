import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/screens/partners/bloc/partners_bloc.dart';
import 'package:gap/gap.dart';

class PartnersScreen extends StatefulWidget {
  @override
  State<PartnersScreen> createState() => _PartnersScreenState();
}

class _PartnersScreenState extends State<PartnersScreen> {
  late Dimens dimens;
  late PartnersBloc partnersBloc;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return Scaffold(
      body: GreenImageBackground(
        child: BlocProvider(
          create: (context) => PartnersBloc()..add(PartnersGetEvent()),
          child: BlocConsumer<PartnersBloc, PartnersState>(
            listener: (context, state) {
              if (state is PartnersErrorState) {
                showErrorMessageSnackBar(
                  context,
                  state.failure.getErrorMessage(context),
                );
              }
            },
            builder: (context, state) {
              partnersBloc = BlocProvider.of<PartnersBloc>(context);
              if (state is PartnersLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is PartnersLoadedState) {
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: dimens.paddingHorizontal16,
                  ),
                  child: Column(
                    children: [
                      Gap(dimens.paddingVerticalItem59),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.partnersaText,
                            style: dimens.settingsStyle,
                          ),
                          InkWell(
                            child: Icon(
                              AppImage.infocircleIcon,
                              size: dimens.height24,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.partners.length,
                          itemBuilder: (context, index) {
                            final partner = state.partners[index];
                            return Card(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    dimens.radius16,
                                  ),
                                  color: AppColors.partnersCardColor,
                                ),
                                height: dimens.height268,
                                padding: EdgeInsets.all(
                                  dimens.paddingVerticalItem20,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // SvgPicture.network(
                                    //   partner.image,
                                    // ),
                                    // Text(
                                    //   '#${partner.id}',
                                    //   style: TextStyle(
                                    //     fontSize: 18,
                                    //     fontWeight: FontWeight.bold,
                                    //   ),
                                    // ),
                                    Text(
                                      AppStrings.servicesText,
                                      style: dimens.partnersTextSty,
                                    ),
                                    Gap(dimens.paddingVerticalItem8),
                                    MyPartnersRowWidget(
                                      image: AppImage.partnersKaskoIcon,
                                      text: AppStrings.kasko,
                                    ),
                                    Gap(dimens.paddingVerticalItem8),
                                    MyPartnersRowWidget(
                                      image: AppImage.partnersOsagoIcon,
                                      text: AppStrings.osago,
                                    ),
                                    Gap(dimens.paddingVerticalItem8),
                                    MyPartnersRowWidget(
                                      image: AppImage.partnersTravelIcon,
                                      text: AppStrings.travel,
                                    ),
                                    // Text(
                                    //   'Phone: ${partner.phone}',
                                    //   style: TextStyle(fontSize: 16),
                                    // ),
                                    // Gap(dimens.height10),
                                    // Text(
                                    //   'Website: ${partner.site.isEmpty ? 'N/A' : partner.site}',
                                    //   style: const TextStyle(
                                    //     fontSize: 14,
                                    //     color: Colors.blue,
                                    //   ),
                                    // ),
                                    Gap(dimens.paddingVerticalItem8),
                                    Text(
                                      AppStrings.pointText,
                                      style: dimens.pointStyle,
                                    ),
                                    Gap(dimens.paddingVerticalItem8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        PartnersButton(
                                          image: AppImage.partnersCallOpercon,
                                          text: AppStrings.languageText,
                                          onclick: () {},
                                        ),
                                        Gap(dimens.paddingHorizontal8),
                                        PartnersButton(
                                          image: AppImage.partnersVebSaytcon,
                                          text: AppStrings.languageText,
                                          onclick: () {},
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }
              if (state is PartnersErrorState) {
                return Center(
                  child: Text(
                    'Failed to load partners.',
                    style: TextStyle(color: Colors.red),
                  ),
                );
              }
              return Center(
                child: Text(
                  'No partners found.',
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// import 'package:epolisplus/ui/widgets/widgets_export.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:epolisplus/utils/utils_export.dart';
// import 'package:epolisplus/ui/screens/partners/bloc/partners_bloc.dart';
// import 'package:gap/gap.dart';

// import 'package:url_launcher/url_launcher.dart';

// class PartnersScreen extends StatefulWidget {
//   @override
//   State<PartnersScreen> createState() => _PartnersScreenState();
// }

// class _PartnersScreenState extends State<PartnersScreen> {
//   late Dimens dimens;
//   late PartnersBloc partnersBloc;

//   Future<void> _launchPhone(String phone) async {
//     final Uri phoneUri = Uri(scheme: 'tel', path: phone);
//     if (await canLaunchUrl(phoneUri)) {
//       await launchUrl(phoneUri);
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Could not launch phone: $phone')),
//       );
//     }
//   }

//   Future<void> _launchWebsite(String url) async {
//     final Uri siteUri = Uri.parse(url);
//     if (await canLaunchUrl(siteUri)) {
//       await launchUrl(siteUri);
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Could not launch website: $url')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     dimens = Dimens(context);

//     return Scaffold(
//       body: GreenImageBackground(
//         child: BlocProvider(
//           create: (context) => PartnersBloc()..add(PartnersGetEvent()),
//           child: BlocConsumer<PartnersBloc, PartnersState>(
//             listener: (context, state) {
//               if (state is PartnersErrorState) {
//                 showErrorMessageSnackBar(
//                   context,
//                   state.failure.getErrorMessage(context),
//                 );
//               }
//             },
//             builder: (context, state) {
//               partnersBloc = BlocProvider.of<PartnersBloc>(context);
//               if (state is PartnersLoadingState) {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//               if (state is PartnersLoadedState) {
//                 return Container(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: dimens.paddingHorizontal16,
//                   ),
//                   child: Column(
//                     children: [
//                       Gap(dimens.paddingVerticalItem59),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             AppStrings.partnersaText,
//                             style: dimens.settingsStyle,
//                           ),
//                           InkWell(
//                             child: Icon(
//                               AppImage.infocircleIcon,
//                               size: dimens.height24,
//                               color: AppColors.whiteColor,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Expanded(
//                         child: ListView.builder(
//                           itemCount: state.partners.length,
//                           itemBuilder: (context, index) {
//                             final partner = state.partners[index];
//                             return Card(
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(
//                                     dimens.radius16,
//                                   ),
//                                   color: AppColors.partnersCardColor,
//                                 ),
//                                 height: dimens.height268,
//                                 padding: EdgeInsets.all(
//                                   dimens.paddingVerticalItem20,
//                                 ),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       '#${partner.id}',
//                                       style: TextStyle(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     Gap(dimens.height10),
//                                     Text(
//                                       'Phone: ${partner.phone}',
//                                       style: TextStyle(fontSize: 16),
//                                     ),
//                                     Gap(dimens.height10),
//                                     Text(
//                                       'Website: ${partner.site.isEmpty ? 'N/A' : partner.site}',
//                                       style: const TextStyle(
//                                         fontSize: 14,
//                                         color: Colors.blue,
//                                       ),
//                                     ),
//                                     Text(
//                                       AppStrings.pointText,
//                                       style: dimens.pointStyle,
//                                     ),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         PartnersButton(
//                                           image: AppImage.partnersCallOpercon,
//                                           text: 'Call',
//                                           onclick: () =>
//                                               _launchPhone(partner.phone),
//                                         ),
//                                         Gap(dimens.paddingHorizontal8),
//                                         PartnersButton(
//                                           image: AppImage.partnersVebSaytcon,
//                                           text: 'Visit Website',
//                                           onclick: () => _launchWebsite(
//                                               partner.site.isEmpty
//                                                   ? 'https://example.com'
//                                                   : partner.site),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               }
//               if (state is PartnersErrorState) {
//                 return Center(
//                   child: Text(
//                     'Failed to load partners.',
//                     style: TextStyle(color: Colors.red),
//                   ),
//                 );
//               }
//               return Center(
//                 child: Text(
//                   'No partners found.',
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
