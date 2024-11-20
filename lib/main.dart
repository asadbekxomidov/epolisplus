// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'ui/screens/screns_export.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       // home: HomeScreen(),
//       home: SplashScreen(),
//     );
//   }
// }

import 'package:epolisplus/ui/screens/screns_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// void main() {
//   runApp(
//     MultiBlocProvider(
//       providers: [
//         BlocProvider<QuestionsBloc>(
//           create: (_) => QuestionsBloc(),
//         ),
//         // Other providers
//       ],
//       child: MyApp(),
//     ),
//   );
// }

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => SplashScreen(),
      //   '/QuestionsScreen': (context) => const QuestionsScreen(),
      // },
    );
  }
}
