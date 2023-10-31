import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:petrol_pump/theameConstants.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  bool isorderManger=true;
  bool issationManger=false;
  bool isdriver=false;
  bool? isrememberme=true;
  orderManger(){
   isorderManger=true;
   issationManger=false;
   isdriver=false;

   setState(() {
   });
  }
  satationManager(){
     isorderManger=false;
     issationManger=true;
     isdriver=false;
    setState(() {

    });
  }
  driver(){
    isorderManger=false;
    issationManger=false;
    isdriver=true;
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        height: Get.height,
        child: Stack(
          alignment: Alignment.topCenter,

          children: [
            Container(
                height: Get.height/3,
                child: Image.asset("assets/images/logintop.png",fit: BoxFit.fill,)
            ),
            Positioned(
                top: 50,
                child: Image.asset("assets/images/loginLogo.png",height: 145.h,width: 121.w,)),
            Positioned(
              top: Get.height/3+20,
              child: Container(
                width: Get.width-30,
                height: 50.h,
                decoration: BoxDecoration(
                  color: Color(0xFFEFE7EC),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    topButtons("Order Manager",orderManger,isorderManger),
                    topButtons("satation Manager",satationManager,issationManger),
                    topButtons("driver",driver,isdriver),
                    
                  ],
                ),
              ),
            ),
            Positioned(
                top: Get.height/3+100,
                child: Container(
                  padding: EdgeInsets.all(8),
                  height: Get.height/2-50,
                  width: Get.width-60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200, // Shadow color
                        offset: Offset(0, 7), // Shadow offset (x, y)
                        blurRadius: 7, // Shadow blur radius
                        spreadRadius: 3, // Spread radius
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:Column(
                    children: [
                      Text("Welcome Back", style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 23.sp, fontWeight: FontWeight.normal,),),
                      Text("Use Credentials to access your account", style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 15.sp, fontWeight: FontWeight.normal,),),
                      SizedBox(height: 10,),
                      TextField(),
                      SizedBox(height: 10,),
                      TextField(),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(value: isrememberme??false, onChanged: (va){
                                setState(() {
                                  isrememberme=va;
                                });
                              }),
                              Text("Remember me",style: Theme.of(context).textTheme.bodySmall,),
                            ],
                          ),
                          Text("Forget Password?",style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),),
                        ],
                      ),
                      SizedBox(height: 30.h,),
                      ElevatedButton(onPressed: (){}, child: Text("SignUp"))
                    ],
                ),
                ))
          ],
        ),
      ),
    );
  }
  Widget topButtons(String name,onpress,bool active){
    return Container(
        height: 50.h,
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

