import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:petrol_pump/theameConstants.dart';
import 'package:petrol_pump/ui/driver/consants.dart';
import 'package:petrol_pump/ui/orderManager/orders/order_recipt.dart';
import '../../widgets/custom_appbar.dart';
import '../widgets/custom_btn.dart';
import '../widgets/drwaer.dart';
import 'controller.dart';
class ApprovedOrdersScreen extends StatefulWidget {
  const ApprovedOrdersScreen({Key? key}) : super(key: key);
  @override
  State<ApprovedOrdersScreen> createState() => _ApprovedOrdersScreenState();
}
class _ApprovedOrdersScreenState extends State<ApprovedOrdersScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  var orderfilter=Get.put(OrderedFilterController());

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
                custom_appbar(context,scaffoldKey,"Orders Reports"),
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
                        Get.to(()=>OrderReciptScreen(),transition: Transition.rightToLeft,duration: Duration(milliseconds: 300));
                      },
                      child: ApprovedOrdersScreen()
                  ),
              ],
            )
            //Topbar
          ],
        ),
      ),
    );
  }
  Widget ApprovedOrdersScreen(){
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
    Future _bottomsheet(BuildContext context){
      return showModalBottomSheet(context: context, builder: (_) {
        return GetBuilder(
          init: orderfilter,
          builder: (_) {
            return Container(
              decoration: BoxDecoration(
                  color: darkcolor,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
              ),
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
                  SizedBox(height: 20.h,),
                  Divider(thickness: 2),
                  Container(
                    width: 0.1.sw,
                      margin: EdgeInsets.all(15),
                      alignment: Alignment.center,
                      child: Text("Choose Your Filter",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: backgroundColor),)),
                  SizedBox(height: 10,),
                  //Data
                  Container(
                    width: 0.2.sw,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            custom_btn(onpress: orderfilter.ordered,title: "order",backgroudcolor1: orderfilter.orderbtn.value?btnColor:backgroundColor,textcolor: orderfilter.orderbtn.value?backgroundColor:textColor,context: context),
                            custom_btn(onpress: orderfilter.en_route,title: "En route",backgroudcolor1: orderfilter.enroutebtn.value?btnColor:backgroundColor,textcolor: orderfilter.enroutebtn.value?backgroundColor:textColor,context: context),
                          ],
                        ),
                        SizedBox(height: 30,),
                        Row(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            custom_btn(onpress: orderfilter.dilvered,title: "Dilvered",backgroudcolor1: orderfilter.dilveredbtn.value?btnColor:backgroundColor,textcolor: orderfilter.dilveredbtn.value?backgroundColor:textColor,context: context),
                            custom_btn(onpress: orderfilter.approved,title: "Approved",backgroudcolor1: orderfilter.approvedbtn.value?btnColor:backgroundColor,textcolor: orderfilter.approvedbtn.value?backgroundColor:textColor,context: context),
                          ],
                        )

                      ],
                    ),
                  )
                ],
              ),
            );
          }
        );
      });
    }

  }

