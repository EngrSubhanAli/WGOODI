import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petrol_pump/theameConstants.dart';
import 'package:petrol_pump/ui/widgets/custom_botton.dart';
Future dilog_cancel_dragableView(context){
  return   showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        scrollable: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Center(child: Text("Are you sure?",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black,fontWeight: FontWeight.bold),)),
        content: Container(
          height: .3.sh,
          width: 0.8.sw,
          child: Column(
            children: [
              TextFormField(
                initialValue: "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                minLines: null, // No enforced minimum lines
                maxLines: null, // No enforced maximum lines
                keyboardType: TextInputType.multiline,
                style: Theme.of(context).textTheme.bodySmall,
                decoration: InputDecoration(
                  labelText: "Reason",
                ),
              ),
              SizedBox(height: 20,),
              custom_botton1(context, titile: "Add attachment", onpress: (){},icon: Icons.add),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: (){
                    Navigator.of(context).pop();
                  }, child: Text("Confrim",style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold,color: Colors.white),)),
                  ElevatedButton(
                      style: ButtonStyle(
                        side: MaterialStateProperty.all(BorderSide(color: btnColor, width: 2.0,)),
                        backgroundColor: MaterialStatePropertyAll(Colors.white),
                        elevation: MaterialStatePropertyAll(0),
                      ),
                      onPressed: (){
                    Navigator.of(context).pop();
                  }, child: Text("Cancel",style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),)),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}