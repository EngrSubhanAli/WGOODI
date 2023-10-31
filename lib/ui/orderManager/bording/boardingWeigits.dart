import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget boardingScreenOne(BuildContext context){
  return Stack(
    alignment: Alignment.center,
    children: [
      Positioned(
          top: Get.height/3-200,
          child: Image.asset("assets/images/borading1.png",height: 250.h,width: 250.w,)),
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset("assets/images/boardingbtm.png",fit: BoxFit.fill,)
        ],
      ),
      Positioned(
        top:Get.height / 2 + 20, // Adjust the top position as needed
        left: 0,
        right: 0,
        child: Column(
          children: [
            SizedBox(height: 10,),
            Text(
                "Truck Driver",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white)

            ),
            Container(
                width: Get.width*.8,
                child: Text("Lorem Ipsum is simply dummy kadksak sdjnsa na "
                    "Lorem Ipsum is simply",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),)),
          ],
        ),
      ),

    ],
  );
}
Widget boardingScreentwo(BuildContext context){
  return Stack(
    alignment: Alignment.center,
    children: [
      Positioned(
          top: Get.height/3-200,
          child: Image.asset("assets/images/boarding2.png",height: 250.h,width: 250.w,)),
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset("assets/images/boardingbtm.png",fit: BoxFit.fill,)
        ],
      ),
      Positioned(
        top:Get.height / 2 + 20, // Adjust the top position as needed
        left: 0,
        right: 0,
        child: Column(
          children: [
            SizedBox(height: 10,),
            Text(
                "Truck Driver",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white)

            ),
            Container(
                width: Get.width*.8,
                child: Text("Lorem Ipsum is simply dummy kadksak sdjnsa na "
                    "Lorem Ipsum is simply",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),)),
          ],
        ),
      ),

    ],
  );
}