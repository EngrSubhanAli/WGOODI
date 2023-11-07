import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:petrol_pump/theameConstants.dart';
import 'package:petrol_pump/ui/driver/ongoing_orders/en_routeOrderScreen.dart';
import 'package:petrol_pump/ui/orderManager/home/homeScreen.dart';
import 'package:petrol_pump/ui/stationManager/home/home.dart';

import '../../models/order_request.dart';
import '../driver/home/order_request_Screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isOrderManager = true;
  bool isStationManager = false;
  bool isDriver = false;
  bool? isRememberMe = true;
  bool _obscureText = true;

  void orderManager() {
    setState(() {
      isOrderManager = true;
      isStationManager = false;
      isDriver = false;
    });
  }

  void stationManager() {
    setState(() {
      isOrderManager = false;
      isStationManager = true;
      isDriver = false;
    });
  }

  void driver() {
    setState(() {
      isOrderManager = false;
      isStationManager = false;
      isDriver = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildTopSection(),
            SizedBox(height: 5,),
            Container(

              margin: EdgeInsets.zero,
              width: 0.9.sw,
              height: 40.h,
              decoration: BoxDecoration(
                color: Color(0xFFEFE7EC),
                borderRadius: BorderRadius.circular(30),
                boxShadow: shadow
              ),
              child: Wrap(
                alignment: WrapAlignment.spaceBetween, // Adjust alignment as needed
                children: [
                  topButtons("Order Manager", orderManager, isOrderManager),
                  topButtons("Station Manager", stationManager, isStationManager),
                  topButtons("Driver", driver, isDriver),
                ],
              ),
            ),
            SizedBox(height: 30,),
            _buildBottomSection(context),
            SizedBox(height: 30.h,),
          ],
        ),
      ),
    );
  }

  Widget _buildTopSection() {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 0.40.sh,
          width: Get.width,
          child: Image.asset("assets/images/logintop.png", fit: BoxFit.fill),
        ),
        Positioned(
          top: 50.h,
          child: Image.asset(
            "assets/images/loginLogo.png",
            height: 145.h,
            width: 121.w,
          ),
        ),
      ],
    );
  }

  Widget _buildBottomSection(BuildContext context) {
    return Container(

      width: 0.85.sw,
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 5, // Controls the size of the shadow
            blurRadius: 5, // Controls the blurriness of the shadow
            offset: Offset(0, 0), // Controls the position of the shadow
          ),
        ],
        borderRadius: BorderRadius.circular(10.w),
      ),
      // padding: EdgeInsets.all(8),
      child: Column(
        children: [
          SizedBox(height: 20,),
          Text(
            "WELCOME BACK!",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 23.sp, fontWeight: FontWeight.normal),
          ),
          SizedBox(height: 10,),
          Text(
            "Use Credentials to access your account",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 15.sp, fontWeight: FontWeight.normal),
          ),
          SizedBox(height: 25,),
          const SizedBox(height: 10),
          TextField(
            style: Theme.of(context).textTheme.bodySmall,
            decoration: InputDecoration(labelText: "Email",
            hintText: "user@gmail.com"
            ),
          ),
          SizedBox(height: 10.h),
          TextField(
            style: Theme.of(context).textTheme.bodySmall,
            decoration: InputDecoration(
              labelText: "Password",
              hintText: "**********",
              suffixIcon: Container(
                width: 40,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: _obscureText?Icon(Icons.remove_red_eye):Image.asset("assets/icons/lock.png"),
                ),
              ),
            ),
            obscureText: _obscureText,
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    activeColor: Colors.green,
                    value: isRememberMe ?? false,
                    onChanged: (value) {
                      setState(() {
                        isRememberMe = value;
                      });
                    },
                  ),
                  Text("Remember me", style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
              Text("Forget Password?", style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold)),
            ],
          ),
           SizedBox(height: 35.h),
          ElevatedButton(onPressed: () {
            isOrderManager?Get.to(()=>HomeScreen(),transition: Transition.rightToLeftWithFade,duration: Duration(milliseconds: 300)):isDriver?
            Get.to(()=>OrderRequestScreen(),transition: Transition.rightToLeftWithFade,duration: Duration(milliseconds: 300)):
            Get.to(()=>HomeScrenStation(),transition: Transition.rightToLeftWithFade,duration: Duration(milliseconds: 300));
            //
          }, child: Text("  Sign In  ",style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white,fontWeight: FontWeight.bold),)),
          SizedBox(height: 35.h),
        ],
      ),
    );
  }
  Widget topButtons(String name,onpress,bool active){
    return Container(
        height:40.h,
        child: ElevatedButton(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              backgroundColor: active
                  ? MaterialStateProperty.all(darkcolor)
                  : MaterialStateProperty.all(Color(0xFFEFE7EC)),
              padding: MaterialStateProperty.all(EdgeInsets.only(left: 7,right: 7)),
            ),
            onPressed: onpress, child: Text(name,style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: active?backgroundColor:darkcolor,fontWeight: FontWeight.bold,fontSize: 13.sp
        ),))
    );
  }
}
