import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:epolisplus/ui/widgets/greenbackground.dart';
import 'package:epolisplus/ui/screens/partners/bloc/partners_bloc.dart';
import 'package:gap/gap.dart';

class PartnersScreen extends StatefulWidget {
  @override
  State<PartnersScreen> createState() => _PartnersScreenState();
}

class _PartnersScreenState extends State<PartnersScreen> {
  late Dimens dimens;

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
              if (state is PartnersLoadingState) {
                return Center(
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
                                    Text(
                                      '#${partner.id}',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Phone: ${partner.phone}',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Website: ${partner.site.isEmpty ? 'N/A' : partner.site}',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.blue),
                                    ),
                                    Text(
                                      AppStrings.pointText,
                                      style: dimens.pointStyle,
                                    ),
                                    // SizedBox(height: 10),
                                    // partner.image.isNotEmpty
                                    //     ? Image.network(
                                    //         partner.image,
                                    //         fit: BoxFit.cover,
                                    //         height: 100,
                                    //       )
                                    //     : SizedBox.shrink(),
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
              return Center(child: Text('No partners found.'));
            },
          ),
        ),
      ),
    );
  }
}
