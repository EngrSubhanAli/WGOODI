import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petrol_pump/theameConstants.dart';
import 'package:petrol_pump/ui/orderManager/splashScreen.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: Size(360, 640), // Set your design size
      builder: (context, widget) => MaterialApp(
        home: const MyApp(),
      ),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
       title: 'Flutter Demo',
       theme: ThemeData(
         elevatedButtonTheme: ElevatedButtonThemeData(
             style: ElevatedButton.styleFrom(
               backgroundColor: btnColor,
               foregroundColor: backgroundColor,
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(25.0),
               ),
             )
         ),
         scaffoldBackgroundColor: Colors.white,
         textTheme: TextTheme(
           bodyLarge: myTextStylelarge,
           bodyMedium: myTextStylemedium,
           bodySmall: myTextStylesmall,
         ),
         inputDecorationTheme:myInputDecorationTheme(),
         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
         useMaterial3: true,
       ),
       home: const SplashScreen(),
     );
  }
}

