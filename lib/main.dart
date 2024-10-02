import 'package:epolisplus/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'ui/ui_export.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PhoneLoginScreen(),
        routes: {
          '/phonelogin': (context) => PhoneLoginScreen(),
          '/login': (context) => LoginScreen(),
          '/create-account': (context) => CreateAccountScreen(),
          '/verification': (context) => VerificationScreen(),
          '/reset-password': (context) => ResetPasswordScreen(),
          '/phone-reset-password': (context) => PhoneRasswordScreen(),
          '/home': (context) => HomeScreen(),
        },
      ),
    );
  }
}
