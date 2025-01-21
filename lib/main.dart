import 'package:epolisplus/ui/screens/select_warranty/ui/screen/selectwarranty_codes.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:epolisplus/ui/screens/screns_export.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SelectwarrantyCodes(),
      // home: SplashScreen(),
    );
  }
}
