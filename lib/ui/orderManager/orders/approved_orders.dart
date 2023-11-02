import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:petrol_pump/theameConstants.dart';
import 'package:petrol_pump/ui/orderManager/orders/order_recipt.dart';

import '../../widgets/custom_appbar.dart';
import '../../widgets/drwaer.dart';

class ApprovedOrders extends StatefulWidget {
  const ApprovedOrders({Key? key}) : super(key: key);

  @override
  State<ApprovedOrders> createState() => _ApprovedOrdersState();
}

class _ApprovedOrdersState extends State<ApprovedOrders> {
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
              margin: EdgeInsets.only(top: 50.h,left: 20,right: 20,bottom: 10),
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      custom_appbar(context,toggledrawer),
                      SizedBox(height: 15.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Aproved Orders",style: Theme.of(context).textTheme.bodyLarge,),
                          IconButton(onPressed: (){
                            _bottomsheet(context);
                          }, icon: Icon(Icons.filter_alt_outlined))
                        ],
                      ),
                      SizedBox(height: 23.h,),
                      for(var i=0;i<6;i++)
                        GestureDetector(
                            onTap: (){
                              Get.to(()=>OrderRecipt(),transition: Transition.rightToLeft,duration: Duration(milliseconds: 300));
                            },
                            child: approvedOrders()
                        ),

                    ],
                  )
                  //Topbar

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
  Widget approvedOrders(){
    return Container(
      margin: EdgeInsets.only(bottom: 30,left: 15,right: 15),
      padding: EdgeInsets.only(left: 30,right: 10,top: 5),
      height: 0.18.sh,
      width: 0.85.sw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: darkcolor,width: 1),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text("Driver Name: ",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),),
                  Text("Rakan",style: Theme.of(context).textTheme.bodySmall!.copyWith(),),

                ],
              ),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
          Row(children: [
            Text("Station Name: ",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),),
            Text("MJCD123",style: Theme.of(context).textTheme.bodySmall!.copyWith(),),

          ],),
          Row(children: [
            Text("Paid Amount: ",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),),
            Text("6000",style: Theme.of(context).textTheme.bodySmall!.copyWith(),),

          ],),
          Divider(thickness: 2,height: 20.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Recipt Number: ",style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),),
              Text("1234567890",style: Theme.of(context).textTheme.bodySmall!.copyWith(),),

            ],
          )

        ],
      ),
    );
  }
  ordered(){}
  en_route(){}
  dilvered(){}
  approved(){}

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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      custom_btn(onpress: ordered,title: "order",backgroudcolor1: Colors.white,textcolor: darkcolor),
                      SizedBox(width: 20,),
                      custom_btn(onpress: en_route,title: "En route",backgroudcolor1: btnColor,textcolor: backgroundColor),

                    ],
                  ),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      custom_btn(onpress: dilvered,title: "Dilvered",backgroudcolor1: btnColor,textcolor: backgroundColor),
                      SizedBox(width: 20,),
                      custom_btn(onpress: approved,title: "Approved",backgroudcolor1: btnColor,textcolor: backgroundColor),


                    ],
                  )

                ],
              )
            ],
          ),
        );
      });
    }
    Widget custom_btn({required onpress,required title,Color? backgroudcolor1,Color? textcolor}){
    return Container(
      width: .37.sw,
      height: 40,
      decoration: BoxDecoration(
        color: backgroudcolor1,
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

  }

