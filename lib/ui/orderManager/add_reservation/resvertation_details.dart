import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:petrol_pump/ui/orderManager/add_reservation/stepControlller.dart';
import '../../../theameConstants.dart';
var stepCon=Get.put(StepController());
Widget reservationDetails(BuildContext context){
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  return Container(
    width: 0.9.sw,
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow:shadow,
      borderRadius: BorderRadius.circular(10.w),
    ),
    padding: EdgeInsets.all(15),
    child: Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          costomTextField("Gas Type","50",context),
          SizedBox(height: 10,),
          costomTextField("UMO","Liters",context),
          SizedBox(height: 10,),
          costomTextField("Balance Voloume","20,000",context),
          SizedBox(height: 10,),
          costomTextField("Required Volume","36,000",context),
          SizedBox(height: 0.2.sh,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              custom_button(context,0),
              ElevatedButton(onPressed: (){
                stepCon.step(2);
              }, child: Text("Place Order", style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white,fontSize: 18.sp),
              )
              ),
            ],
          ),
          SizedBox(height: 20,)
        ],
      ),
    ),
  );
}
//Custom Button
Widget custom_button(BuildContext context,index){
  return GestureDetector(
    onTap: (){
      stepCon.step(0);
    },
    child: Container(
      alignment: Alignment.center,
      width: 0.27.sw,
      height: .055.sh,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1), // Set border properties
        borderRadius: BorderRadius.circular(30), // Set border radius
      ),
      child: Text("Cancel",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: btnColor,fontWeight: FontWeight.bold),),
    ),
  );
}
//Custom Text Field
Widget costomTextField(label_text,hint_text,BuildContext context){
  return TextFormField(
    decoration: InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.always,
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