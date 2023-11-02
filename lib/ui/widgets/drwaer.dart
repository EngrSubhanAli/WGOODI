import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:petrol_pump/theameConstants.dart';
import 'package:petrol_pump/ui/orderManager/home/homeScreen.dart';
import 'package:petrol_pump/ui/orderManager/notifications/notification.dart';
import 'package:petrol_pump/ui/orderManager/orders/approved_orders.dart';
class CustomSideBar extends StatefulWidget {
  CustomSideBar({Key? key}) : super(key: key);
  @override
  State<CustomSideBar> createState() => _CustomSideBarState();
}
class _CustomSideBarState extends State<CustomSideBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30.h,left: 20,right: 20),
      color: darkcolor,
      child: Column(
        children: [
          Image.asset("assets/images/drawerlogo.png"),
          ListTile(
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
            onTap: (){
              Get.to(()=>ApprovedOrders(),transition: Transition.rightToLeft,duration: Duration(milliseconds: 300));
            },
            title: Text("Report",style:
            Theme.of(context).textTheme.bodyMedium!.copyWith(color: backgroundColor,fontWeight: FontWeight.bold,)),
            trailing: Icon(
              Icons.arrow_forward, // You can change this icon to the one you prefer
              color: backgroundColor,
            ),
          ),
          Divider(thickness: 4),
          SizedBox(height: 10,),
          ListTile(
            onTap: (){
              Get.to(()=>NoticationScreen(),transition: Transition.rightToLeft,duration: Duration(milliseconds: 300));
            },
            title: Text("Notification",style:
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

