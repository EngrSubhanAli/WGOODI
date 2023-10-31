import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:petrol_pump/ui/orderManager/bording/boardScreen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _returnBoardingScreen()async{
    await Future.delayed(Duration(milliseconds: 1000));
    Get.offAll(()=>Boarding());
  }
  @override
  void initState() {
    _returnBoardingScreen();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/images/splashLogo.png",height: 201.h,width: 232.w,),
      ),
    );
  }
}
