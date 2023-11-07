import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petrol_pump/theameConstants.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_botton.dart';
import '../widgets/drwaer.dart';

class OrderReciptScreen extends StatefulWidget {
  const OrderReciptScreen({Key? key}) : super(key: key);
  @override
  State<OrderReciptScreen> createState() => _OrderReciptScreenState();
}
class _OrderReciptScreenState extends State<OrderReciptScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  void download_recipt_btn(){}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: CustomSideBar(),
      body: Container(
        margin: EdgeInsets.only(top: 30.h,left: 20,right: 20,bottom: 10),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                custom_appbar(context,scaffoldKey,"Approved Orders"),
                SizedBox(height: 15.h),
                Row(
                  children: [
                    Text("Recipt Number: ",style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 25
                    ),),
                    Text("MD12313123",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 17),),
                  ],
                ),
                SizedBox(height: 30.h,),
                Container(
                  margin: EdgeInsets.only(left: 13,right: 13),
                  padding: EdgeInsets.only(left: 20,right: 20,bottom: 20),
                  width: 0.85.sw,
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
