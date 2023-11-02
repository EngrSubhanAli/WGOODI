import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petrol_pump/ui/orderManager/add_reservation/stepControlller.dart';
import '../../widgets/custom_botton.dart';
class AddResvervation extends StatefulWidget {

  AddResvervation({Key? key}) : super(key: key);

  @override
  State<AddResvervation> createState() => _AddResvervationState();
}

class _AddResvervationState extends State<AddResvervation> {
  var stepCon=Get.put(StepController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  add_buying_recipt(){}
  @override
  Widget build(BuildContext context) {
    return  Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          costomTextField("Order Number","50"),
          SizedBox(height: 10,),
          costomTextField("Station Number","Select Station Number"),
          SizedBox(height: 10,),
          costomTextField("Resvertation Date","50"),
          SizedBox(height: 10,),
          costomTextField("Recipt Number","50"),
          SizedBox(height: 10,),
          costomTextField("paid Amount","50"),
          SizedBox(height: 10,),
          costomTextField("Add Excepted Date","50"),
          SizedBox(height: 10,),
          costomTextField("Select start Point","50"),
          SizedBox(height: 10,),
          costomTextField("Add Amount","50"),
          SizedBox(height: 10,),
          costomTextField("Driver","50"),
          SizedBox(height: 10,),
          custom_botton1(context,icon: Icons.add,titile: "DownLoad Recipt",onpress:add_buying_recipt ),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: (){
            stepCon.step(1);
            setState(() {
              print(stepCon.currentstep);
            });
          }, child: Text("Coninue"))
        ],
      ),
    );
  }
  Widget costomTextField(label_text,hint_text){
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
}
