import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theameConstants.dart';

Widget custom_btn({required onpress,required title,Color? backgroudcolor1,Color? textcolor,context}){
  return Container(
    height: 40,
    width: .4.sw,
    decoration: BoxDecoration(

      borderRadius: BorderRadius.circular(10), // Set border radius
    ),
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: backgroudcolor1==Colors.white?MaterialStatePropertyAll(Colors.white):MaterialStatePropertyAll(btnColor),
        elevation: MaterialStateProperty.all(0), // Set elevation to 0
      ),
      onPressed: onpress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: textcolor),
          ),
        ],
      ),
    ),
  );
}