import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petrol_pump/theameConstants.dart';
import 'package:petrol_pump/ui/widgets/custom_appbar.dart';

import '../widgets/dotted_line.dart';
class PastOrderScreen extends StatefulWidget {
  const PastOrderScreen({Key? key}) : super(key: key);

  @override
  State<PastOrderScreen> createState() => _PastOrderScreenState();
}

class _PastOrderScreenState extends State<PastOrderScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              SizedBox(height: 0.07.sh,),
              custom_appbar(context, scaffoldKey, "Past Order"),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("History",style: Theme.of(context).textTheme.bodyLarge,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.h,vertical: 3),
                    decoration: BoxDecoration(
                      color: Color(0xFFEFE7EC),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 0.35.sw,
                    height: 0.04.sh,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("oct 14,2018",style: Theme.of(context).textTheme.bodySmall,),
                        Icon(Icons.keyboard_arrow_down)
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 20.h,),
              for(var i=0;i<5;i++)
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  margin: EdgeInsets.only(bottom: 20.h,left: 10.h,right: 10.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade300,
                        spreadRadius: 2, // Controls the size of the shadow
                        blurRadius: 5, // Controls the blurriness of the shadow
                        offset: Offset(0, 0),
                      )
                    ]
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 0.15.sw,
                            child: Column(
                              children: [
                                SizedBox(height: 10.h,),
                                Stack(
                                  children: [
                                    Container(
                                      child: Icon(
                                        Icons.circle_outlined,
                                        color: Colors.green,
                                        size: 25,
                                      ),
                                    ),
                                    Positioned.fill(
                                      child: Icon(
                                        Icons.circle,
                                        color: Colors.green,
                                        size: 15,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.h,),
                                Container(
                                  child: Transform.rotate(
                                    angle: 90 * (3.141592653589793 / 180), // 90 degrees in radians
                                    child: DottedDivider(
                                      dashCount: 5,
                                      color: darkcolor,
                                      height: 0.02.sh,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20,),
                                Icon(Icons.location_on,color: Colors.red,),
                                SizedBox(height: 5.h,),
                              ],
                            ),
                          ),
                          Container(
                            // padding: EdgeInsets.all(5),
                            padding: EdgeInsets.only(top: 5.h),
                            height: 0.12.sh,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("S123",style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold,color: darkcolor),),
                                SizedBox(height: 10,),
                                Text("MCJD-123",style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold,color: darkcolor),),

                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Container(
                        margin: EdgeInsets.only(left: 12.h,right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(width: 2,),
                                Icon(Icons.monetization_on_rounded,color: darkcolor,),
                                SizedBox(width: 6,),
                                Text("\$30.00 Tip", style: Theme.of(context).textTheme.bodySmall)
                              ],
                            ),
                            Text("Completed",style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),),

                          ],
                        ),
                      )

                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
