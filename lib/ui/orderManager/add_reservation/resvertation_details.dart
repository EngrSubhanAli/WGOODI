import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:petrol_pump/ui/orderManager/add_reservation/stepControlller.dart';

import '../../../theameConstants.dart';
var stepCon=Get.put(StepController());
Widget reservationDetails(BuildContext context){
  bool isactive=true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  return Container(
    width: 0.9.sw,
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow:shadow,
      borderRadius: BorderRadius.circular(10.w),
    ),
    padding: EdgeInsets.all(7),
    child: Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          costomTextField("Gas Type","50",context),
          SizedBox(height: 10,),
          costomTextField("UMO","50",context),
          SizedBox(height: 10,),
          costomTextField("Balance Voloume","50",context),
          SizedBox(height: 10,),
          costomTextField("Required Volume","50",context),
          SizedBox(height: 10,),
          SizedBox(height: 10,),
          Row(
            children: [
              custom_button(context,0),
              SizedBox(width: 5,),
              ElevatedButton(onPressed: (){
                stepCon.step(2);
              }, child: Text("Place Order")),
            ],
          )

        ],
      ),
    ),
  );
}

//Custom Button
Widget custom_button(BuildContext context,index){
  return Container(
    width: 0.3.sw,
    height: 40,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black, width: 1), // Set border properties
      borderRadius: BorderRadius.circular(30), // Set border radius
    ),
    child: ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0), // Set elevation to 0
        backgroundColor: MaterialStateProperty.all(Colors.white),
      ),
      onPressed: () {
        stepCon.step(0);
      },
      child: Text(
        "Cancel",
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: darkcolor),
      ),

    ),
  );
}
//Custom Text Field
Widget costomTextField(label_text,hint_text,BuildContext context){
  return TextFormField(
    decoration: InputDecoration(
      labelText: "$label_text",
      hintText: "$hint_text" ,
      labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
    ),
    style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 15),
  );
}