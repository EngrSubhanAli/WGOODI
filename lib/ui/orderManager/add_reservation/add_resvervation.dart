
  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petrol_pump/ui/orderManager/add_reservation/resvertation_details.dart';

import '../../widgets/custom_botton.dart';


   void add_buying_recipt(){}

  Widget addReservation(BuildContext context,_formKey) {
    return Form(
      key: _formKey,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            costomTextField("Order Number","50",context),
            SizedBox(height: 10,),
            costomTextField("Station Number","Select Station Number",context),
            SizedBox(height: 10,),
            costomTextField("Resvertation Date","21-sep-2023",context),
            SizedBox(height: 10,),
            costomTextField("Recipt Number","Add Recipt Number",context),
            SizedBox(height: 10,),
            costomTextField("paid Amount","Add Amount",context),
            SizedBox(height: 10,),
            costomTextField("Add Excepted Date","Add Excepted Date",context),
            SizedBox(height: 10,),
            costomTextField("Select start Point","Select Star point",context,Icon(Icons.keyboard_arrow_down_sharp)),
            SizedBox(height: 10,),
            costomTextField("Add Amount","Add Amount",context),
            SizedBox(height: 10,),
            costomTextField("Driver","Select Driver",context,Icon(Icons.keyboard_arrow_down_sharp)),
            SizedBox(height: 10,),
            custom_botton1(context,icon: Icons.add,titile: "Add Buying Recipt",onpress:add_buying_recipt ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  stepCon.step(1);
                }, child: Text("   Next   ")),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget costomTextField(label_text,hint_text,context,[Icon? icon]){
    return TextFormField(
      decoration: InputDecoration(
        suffixIcon: icon != null ? IconButton(
          icon: icon,
          onPressed: (){},
        ) : null,
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

