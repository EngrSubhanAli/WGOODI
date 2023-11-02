import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget boardingScreenOne(BuildContext context) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Positioned(
        top: 0.07.sh, // Use sh (screen height) and sw (screen width)
        child: Image.asset(
          "assets/images/borading1.png",
          height: 210.h,
          width: 210.w,
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 1.sw, // Use sw for width and sh for height
            height: 0.65.sh,
            child: Image.asset(
              "assets/images/boardingbtm.png",
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
      Positioned(
        top: 0.5.sh + 20.h, // Adjust the top position as needed
        left: 0,
        right: 0,
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Text(
              "Truck Driver",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.white,
              ),
            ),
            Container(
              width: 0.8.sw,
              child: Text(
                "Lorem Ipsum is simply dummy kadksak sdjnsa na "
                    "Lorem Ipsum is simply",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget boardingScreentwo(BuildContext context) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Positioned(
        top: 0.07.sh,
        child: Image.asset(
          "assets/images/boarding2.png",
          height: 210.h,
          width: 210.w,
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 1.sw,
            height: 0.65.sh,
            child: Image.asset(
              "assets/images/boardingbtm.png",
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
      Positioned(
        top: 0.5.sh + 20.h, // Adjust the top position as needed
        left: 0,
        right: 0,
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Text(
              "Truck Driver",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.white,
              ),
            ),
            Container(
              width: 0.8.sw,
              child: Text(
                "Lorem Ipsum is simply dummy kadksak sdjnsa na "
                    "Lorem Ipsum is simply",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
