import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petrol_pump/theameConstants.dart';

Widget custom_botton1(BuildContext context,{IconData? icon,required titile, required onpress}){
  return  Row(
    children: [
      Container(
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1), // Set border properties
          borderRadius: BorderRadius.circular(10), // Set border radius
        ),
        child: ElevatedButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0), // Set elevation to 0
            backgroundColor: MaterialStateProperty.all(Colors.white),
          ),
          onPressed: onpress,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              icon!=null?Icon(icon,color: darkcolor,):Container(),
              SizedBox(width: 10,),
              Text(
                "$titile",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(color: darkcolor),
              ),
            ],
          ),

        ),
      ),
    ],
  );


}