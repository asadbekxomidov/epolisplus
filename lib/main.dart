import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'ui/screens/screns_export.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: PhoneLoginScreen(),
    ); /*MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => PhoneLoginBloc()),
        BlocProvider(create: (context) => RegisterBloc()),
        BlocProvider(create: (context) => VerificationBloc()),
        BlocProvider(create: (context) => ResetPasswordBloc()),
        BlocProvider(create: (context) => PhonePasswordBloc()),
      ],
      child: ,
    );*/
  }
}
