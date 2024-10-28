import 'package:epolisplus/ui/screens/home/bloc/home_bloc.dart';
import 'package:epolisplus/ui/widgets/widgets_export.dart';
import 'package:epolisplus/utils/utils_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  late Dimens dimens;

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
              // leadingWidth: dimens.width30,
              // leading: LeftBackIconBtn(),
              actions: [
                LogoutButtons(
                  iconData: AppImage.logoutIcon,
                  onClick: () {
                    context.read<HomeBloc>().add(LogoutEvent());
                  },
                ),
              ],
            ),
            body: BlocListener<HomeBloc, HomeState>(
              listener: (context, state) {
                if (state is HomeErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.errorMessage)),
                  );
                }
              },
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return Column(
                    children: [],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
