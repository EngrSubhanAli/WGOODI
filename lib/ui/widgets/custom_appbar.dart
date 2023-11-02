import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theameConstants.dart';

Widget custom_appbar(BuildContext context,press){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    decoration: BoxDecoration(
      color: darkcolor,
      borderRadius: BorderRadius.circular(10),
    ),
    height: Get.height/15-10,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
            onTap:(){
              press();
            },
            child: Image.asset("assets/icons/appbaricon.png",height: 12.h,)),
        Text(
          "Home",
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Colors.white),
        ),
        Icon(Icons.search, color: Colors.white),
      ],
    ),
  );
}