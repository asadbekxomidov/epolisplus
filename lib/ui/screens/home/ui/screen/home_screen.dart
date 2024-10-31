import 'package:epolisplus/ui/screens/home/bloc/home_bloc.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Dimens dimens;
  late HomeBloc homeBloc;

  @override
  Widget build(BuildContext context) {
    dimens = Dimens(context);

    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    context.read<HomeBloc>().add(DeleteAccountEvent());
                  },
                  icon: Icon(Icons.delete, color: AppColors.redColor),
                ),
                LogoutButtons(
                  iconData: AppImage.logoutIcon,
                  onClick: () {
                    context.read<HomeBloc>().add(LogoutEvent());
                  },
                ),
              ],
            ),
            body: SizedBox(
              height: dimens.screenHeight,
              child: Column(
                children: [
                  Image(
                    width: dimens.screenWidth,
                    image: AssetImage(
                      AppImage.homeBlueImage,
                    ),
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
