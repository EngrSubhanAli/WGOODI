import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:petrol_pump/theameConstants.dart';

import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_botton.dart';
import '../../widgets/drwaer.dart';

class OrderRecipt extends StatefulWidget {
  const OrderRecipt({Key? key}) : super(key: key);

  @override
  State<OrderRecipt> createState() => _OrderReciptState();
}

class _OrderReciptState extends State<OrderRecipt> {
  bool isOpenDrwaer=false;
  void toggledrawer(){
    isOpenDrwaer=!isOpenDrwaer;
    setState(() {
    });
  }
  void download_recipt_btn(){}
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
                        children: [
                          Text("Recipt Number: ",style: Theme.of(context).textTheme.bodyLarge,),
                          Text("MD12313123",style: Theme.of(context).textTheme.bodyMedium,),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 10,right: 10,bottom: 20),
                        width: 0.9.sw,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow: shadow
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 15,),
                            costomTextField("Required Date and Time","21-sep-23    11:30",),
                            SizedBox(height: 10.h,),
                            costomTextField("Gas Type","95",),
                            SizedBox(height: 10.h,),
                            costomTextField("UOM","Liters",),
                            SizedBox(height: 10.h,),
                            costomTextField("Balance Voloume","20000",),
                            SizedBox(height: 10.h,),
                            costomTextField("Required Voloume","30000",),
                            SizedBox(height: 10.h,),
                            costomTextField("Intial Voloume","100000",),
                            SizedBox(height: 10.h,),
                            costomTextField("Dilvered Date and Time","21-sep-23    11:30",),
                            SizedBox(height: 10.h,),
                            custom_botton1(context,icon: Icons.file_download_outlined,titile: "DownLoad Recipt",onpress:download_recipt_btn ),


                          ],
                        ),
                      )

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
  Widget costomTextField(label_text,intialValue){
    return TextFormField(
      initialValue: "LKk",
      readOnly: true,
      decoration: InputDecoration(
        labelText: "$label_text",
        hintText: "$intialValue" ,
        labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
      style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 15),
    );
  }
}
