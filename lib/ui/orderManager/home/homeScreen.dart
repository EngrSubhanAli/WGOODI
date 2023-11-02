import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:petrol_pump/theameConstants.dart';

import '../../widgets/custom_appbar.dart';
import '../../widgets/drwaer.dart';
import '../add_reservation/resverationSteper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isOpenDrwaer=false;
  void toggledrawer(){
    isOpenDrwaer=!isOpenDrwaer;
    setState(() {
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          isOpenDrwaer=false;
          setState(() {

          });
        },
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 50.h,left: 10,right: 10,bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Topbar
                  custom_appbar(context,toggledrawer),
                  SizedBox(height: 15.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Station", style: Theme.of(context).textTheme.bodyLarge!),
                      Row(
                        children: [
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1), // Set border properties
                              borderRadius: BorderRadius.circular(30), // Set border radius
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                Get.to(()=>ReservationScreen(),transition: Transition.rightToLeftWithFade,duration: Duration(milliseconds: 300));

                              },
                              child: Text(
                                "favorites",
                                style: Theme.of(context).textTheme.bodySmall!.copyWith(color: darkcolor),
                              ),
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0), // Set elevation to 0
                                backgroundColor: MaterialStateProperty.all(Colors.white),
                              ),
                            ),
                          ),
                          IconButton(onPressed: (){
                            _bottomsheet(context);

                          }, icon: Icon(Icons.filter_alt_outlined)),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 15.h),
                  _stations(),

                ],
              ),
            ),
            isOpenDrwaer?Container(
                width: Get.width*.75,
                child: CustomSideBar()):Container(),

          ],
        ),
      ),
    );
  }
  Widget _stations(){
    return Expanded(
      child: GestureDetector(
        onTap: (){
          Get.to(()=>ReservationScreen(),transition: Transition.rightToLeft,duration: Duration(milliseconds: 300));
        },
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            Color randomColor = Color.fromARGB(
              255,
              Random().nextInt(256),
              Random().nextInt(256),
              Random().nextInt(256),
            );
            return  Container(
              margin: EdgeInsets.only(bottom: 10.h),
              padding: EdgeInsets.all(8.h),
              decoration: BoxDecoration(
                  color: darkcolor,
                  borderRadius: BorderRadius.circular(10)
              ),
              height: 0.22.sh,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text("Station Name: ",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: backgroundColor),),
                          Text("abc",style: Theme.of(context).textTheme.bodySmall!.copyWith(color: backgroundColor),),
                        ],
                      ),
                      Icon(Icons.circle,color: randomColor,),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Last Order: ",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: backgroundColor),),
                      Text("21/sep/2023",style: Theme.of(context).textTheme.bodySmall!.copyWith(color: backgroundColor),),
                    ],
                  ),
                  Row(
                    children: [
                      Text("91: ",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 15,fontWeight: FontWeight.bold,color: backgroundColor)),
                      Text("40000/30000 ",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 15,fontWeight: FontWeight.normal,color: backgroundColor)),
                    ],
                  ),
                  Row(
                    children: [
                      Text("91: ",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 15,fontWeight: FontWeight.bold,color: backgroundColor)),
                      Text("40000/30000 ",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 15,fontWeight: FontWeight.normal,color: backgroundColor)),
                    ],
                  ),
                  Row(
                    children: [
                      Text("D: ",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 15,fontWeight: FontWeight.bold,color: backgroundColor)),
                      Text("40000/30000 ",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 15,fontWeight: FontWeight.normal,color: backgroundColor)),
                    ],
                  ),


                ],
              ),
            );
          },
        ),
      ),
    );
  }
  _bottomsheet(BuildContext context){
    return showModalBottomSheet(context: context, builder: (_) {
      return Container(
        decoration: BoxDecoration(
            color: darkcolor,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
        ),
        padding: EdgeInsets.all(20),
        child: ListView(
          padding: EdgeInsets.only(bottom: 20),
          shrinkWrap: true,
          children: [
            //Divider
            Center(
              child: SizedBox(
                width: 100, // Set the desired width
                child: Divider(
                  thickness: 2, // Set the desired thickness of the divider
                  color: Colors.white, // Set the color of the divider
                ),
              ),
            ),
            SizedBox(height: 20,),
            Divider(thickness: 2),
            SizedBox(height: 20,),
            Container(
                color: darkcolor,
                margin: EdgeInsets.all(15),
                alignment: Alignment.center,
                child: Text("Choose Your Filter",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: backgroundColor),)),

            //Data
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buttom_bottons("Healthy",4,Colors.green),
                SizedBox(height: 10,),
                _buttom_bottons("Be Ready",4,Colors.blue),
                SizedBox(height: 10,),
                _buttom_bottons("Make Order",4,Colors.red),
                SizedBox(height: 20,),
              ],
            )
          ],
        ),
      );
    });
  }

  Widget _buttom_bottons(title,number,Color color){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: Get.width/2,
            decoration: BoxDecoration(
            ),
            height: Get.height/12-20,
            child: ElevatedButton(onPressed: (){}, child: Text("$title",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(color),
              ),
            )
        ),
        SizedBox(width: 10,),
        Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: color, // Set the border color
                width: 2, // Set the border width
              ),
              color: Colors.transparent, // Set the background color to transparent
            ),
            height: Get.height/12-20,
            width: 50,
            child: Text("$number",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold,color: Colors.white),))
      ],
    );
  }
}

