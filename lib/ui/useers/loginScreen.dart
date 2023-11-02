import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:petrol_pump/theameConstants.dart';
import 'package:petrol_pump/ui/orderManager/home/homeScreen.dart';

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
            _buildBottomSection(context),
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
      width: 0.9.sw,
      margin: EdgeInsets.symmetric(horizontal: 15.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            offset: const Offset(0, 7),
            blurRadius: 7,
            spreadRadius: 3,
          ),
        ],
        borderRadius: BorderRadius.circular(10.w),
      ),
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
            width: Get.width - 30,
            height: 50.h,
            decoration: BoxDecoration(
              color: Color(0xFFEFE7EC),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Wrap(
              alignment: WrapAlignment.spaceEvenly, // Adjust alignment as needed
              children: [
                topButtons("Order Manager", orderManager, isOrderManager),
                topButtons("Station Manager", stationManager, isStationManager),
                topButtons("Driver", driver, isDriver),
              ],
            ),
          ),
          SizedBox(height: 10,),

          Text(
            "Welcome Back",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 23.sp, fontWeight: FontWeight.normal),
          ),
          Text(
            "Use Credentials to access your account",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 15.sp, fontWeight: FontWeight.normal),
          ),
          const SizedBox(height: 10),
          TextField(
            style: Theme.of(context).textTheme.bodySmall,
            decoration: InputDecoration(labelText: "Email"),
          ),
          const SizedBox(height: 10),
          TextField(
            style: Theme.of(context).textTheme.bodySmall,
            decoration: InputDecoration(
              labelText: "Password",
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Image.asset("assets/icons/lock.png"),
              ),
            ),
            obscureText: _obscureText,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
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
          const SizedBox(height: 30),
          ElevatedButton(onPressed: () {
            Get.to(()=>HomeScreen(),transition: Transition.rightToLeftWithFade,duration: Duration(milliseconds: 300));
          }, child: Text("Sign Up")),
        ],
      ),
    );
  }
  Widget topButtons(String name,onpress,bool active){
    return Container(
        height:50.h,
        child: ElevatedButton(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              backgroundColor: active
                  ? MaterialStateProperty.all(btnColor)
                  : MaterialStateProperty.all(Color(0xFFEFE7EC)),
              padding: MaterialStateProperty.all(EdgeInsets.only(left: 7,right: 7)),
            ),
            onPressed: onpress, child: Text(name,style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: active?backgroundColor:darkcolor,fontWeight: FontWeight.bold,fontSize: 13.sp
        ),))
    );
  }
}
