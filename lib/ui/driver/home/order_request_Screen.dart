import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:petrol_pump/ui/driver/ongoing_orders/en_routeOrderScreen.dart';
import '../../../models/order_request.dart';
import '../../widgets/custom_appbar.dart';
import '../consants.dart';
import '../widgets/sidebar_driver.dart';
class OrderRequestScreen extends StatefulWidget {
  const OrderRequestScreen({Key? key}) : super(key: key);

  @override
  State<OrderRequestScreen> createState() => _OrderRequestScreenState();
}

class _OrderRequestScreenState extends State<OrderRequestScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: CustomSideBarDriver(),
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            margin: EdgeInsets.only(top: 30.h,left: 20,right: 20,bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //appbar
                custom_appbar(context,scaffoldKey,"Home"),
                SizedBox(height: 15.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Order Request", style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: textColor)),
                  ],
                ),
                SizedBox(height: 15.h),
                _stations()
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _stations(){
    return Container(
      // height: 0.3.sh*dummyOrders.length,
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: dummyOrders.length,
        itemBuilder: (BuildContext context, int index) {
          final order = dummyOrders[index];
          return GestureDetector(
            onTap: () {
              // Handle the onTap action here
            },
            child: order.accepted==false?Container(
              margin: EdgeInsets.only(bottom: 10.h, left: 0.05.sw, right: 0.05.sw),
              padding: EdgeInsets.all(8.h),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              // height: 0.3.sh,
              width: 0.8.sw,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Order Number: ", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 15, fontWeight: FontWeight.bold, color: textColor)),
                      Text("${order.orderNumber}", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 15, fontWeight: FontWeight.normal, color: textColor),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Start Point: ", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 15, fontWeight: FontWeight.bold, color: textColor)),
                      Text("${order.startPoint}", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 15, fontWeight: FontWeight.normal, color: textColor),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Station Name: ", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 15, fontWeight: FontWeight.bold, color: textColor)),
                      Text("${order.stationName}", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 15, fontWeight: FontWeight.normal, color: textColor),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Fuel Quality: ", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 15, fontWeight: FontWeight.bold, color: textColor)),
                      Text("${order.fuelQuality}", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 15, fontWeight: FontWeight.normal, color: textColor),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Fuel Type: ", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 15, fontWeight: FontWeight.bold, color: textColor)),
                      Text("${order.fuelType}", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 15, fontWeight: FontWeight.normal, color: textColor),
                      ),
                    ],
                  ),
                  Divider(thickness: 1, color: textColor),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Expected Arrival: ", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 15, fontWeight: FontWeight.bold, color: textColor)),
                      Text("21-sep-2023 11:30AM", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 15, fontWeight: FontWeight.normal, color: textColor),
                      ),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(bottonColor1),
                            ),
                            onPressed: () {
                              order.accepted=true;
                              setState(() {
                                Get.to(()=>EnRouteOrderScreen(),transition: Transition.rightToLeft,duration: Duration(milliseconds: 300));
                              });
                            },
                            child: Text("Accept", style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      order.accepted==false? SizedBox(width: 10.w,):SizedBox(),
                      order.accepted==true?SizedBox(width: 10,):Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.white),
                            elevation: MaterialStatePropertyAll(0),
                            side: MaterialStateProperty.all(BorderSide(
                              color: Colors.red, // Border color
                              width: 2.0,          // Border width
                            )),

                          ),
                          onPressed: () {
                            setState(() {
                            });
                            // Handle the Reject button action here
                          },
                          child: Text("Reject", style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.red,fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ):SizedBox(),
          );
        },
      ),
    );

  }
}

