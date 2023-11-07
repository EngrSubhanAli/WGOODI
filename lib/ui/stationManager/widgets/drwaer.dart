import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:petrol_pump/theameConstants.dart';
import 'package:petrol_pump/ui/orderManager/home/homeScreen.dart';
import 'package:petrol_pump/ui/orderManager/notifications/notificationScreen.dart';
import 'package:petrol_pump/ui/orderManager/orders/approved_orders.dart';
import 'package:petrol_pump/ui/stationManager/notification/notificationScreen.dart';

import '../en_routeDeliveries/en_routeDeliveriesScreen.dart';
class CustomSideBarStationManager extends StatefulWidget {
  CustomSideBarStationManager({Key? key}) : super(key: key);
  @override
  State<CustomSideBarStationManager> createState() => _CustomSideBarStationManagerState();
}
class _CustomSideBarStationManagerState extends State<CustomSideBarStationManager> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.only(top: 30.h,left: 20,right: 20),
        color: darkcolor,
        child: Column(
          children: [
            Image.asset("assets/images/drawerlogo.png"),
            ListTile(
              contentPadding: EdgeInsets.zero,
              onTap: (){
                Get.to(()=>HomeScreen(),transition: Transition.rightToLeft,duration: Duration(milliseconds: 300));
              },
              title: Text("Home",style:
              Theme.of(context).textTheme.bodyMedium!.copyWith(color: backgroundColor,fontWeight: FontWeight.bold,),),
              trailing: Icon(
                Icons.arrow_forward, // You can change this icon to the one you prefer
                color: backgroundColor,
              ),
            ),
            Divider(thickness: 4),
            SizedBox(height: 10,),
            ListTile(
              contentPadding: EdgeInsets.zero,

              onTap: (){
                Get.to(()=>Notication_stationManager_Screen(),transition: Transition.rightToLeft,duration: Duration(milliseconds: 300));
              },
              title: Text("Notifications",style:
              Theme.of(context).textTheme.bodyMedium!.copyWith(color: backgroundColor,fontWeight: FontWeight.bold,)),
              trailing: Icon(
                Icons.arrow_forward, // You can change this icon to the one you prefer
                color: backgroundColor,
              ),
            ),
            Divider(thickness: 4),
            SizedBox(height: 10,),
            ListTile(
              contentPadding: EdgeInsets.zero,

              onTap: (){
                Get.to(()=>NoticationScreen(),transition: Transition.rightToLeft,duration: Duration(milliseconds: 300));
              },
              title: Text("New Deliveries",style:
              Theme.of(context).textTheme.bodyMedium!.copyWith(color: backgroundColor,fontWeight: FontWeight.bold,),),
              trailing: Icon(
                Icons.arrow_forward, // You can change this icon to the one you prefer
                color: backgroundColor,
              ),

            ),
            Divider(thickness: 4),
            SizedBox(height: 10,),
            ListTile(
              contentPadding: EdgeInsets.zero,
              onTap: (){
                Get.to(()=>EnRouteDeliveriesScreen(),transition: Transition.rightToLeft,duration: Duration(milliseconds: 300));

              },
              title: Text("En Route Deliveries",style:
              Theme.of(context).textTheme.bodyMedium!.copyWith(color: backgroundColor,fontWeight: FontWeight.bold,),),
              trailing: Icon(
                Icons.arrow_forward, // You can change this icon to the one you prefer
                color: backgroundColor,
              ),

            ),
            Divider(thickness: 4),
            SizedBox(height: 10,),
            Expanded(
              child: Container(
                alignment: Alignment.bottomLeft,
                margin: EdgeInsets.only(top: 50,bottom: 50), // Adjust the top margin to move it to the bottom
                child: ListTile(
                  onTap: (){
                    _bottomsheet(context);
                  },
                  title: Text("LogOut",style:
                  Theme.of(context).textTheme.bodyMedium!.copyWith(color: backgroundColor,fontWeight: FontWeight.bold,),),
                  trailing: Icon(
                    Icons.login, // You can change this icon to the one you prefer
                    color: backgroundColor,
                  ),
                ),
              ),
            ),
            // Add more items to the Drawer here
          ],
        ),
      ),
    );
  }

  //bottom Sheet

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
                child: Text("Are You sure you want to Logout",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: backgroundColor),)),
            Column(
              children: [
                Container(
                    width: Get.width,
                    height: Get.height/12-20,

                    child: ElevatedButton(onPressed: (){}, child: Text("Yes Logout",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: backgroundColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),),
                    )
                ),
                SizedBox(height: 20,),
                Container(
                    width: Get.width,
                    height: Get.height/12-20,
                    child: ElevatedButton(onPressed: (){}, child: Text("Cancel",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: darkcolor,
                      fontWeight: FontWeight.bold,
                    ),),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.white),
                      ),
                    )
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}

