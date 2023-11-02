import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:petrol_pump/theameConstants.dart';
import 'package:petrol_pump/ui/orderManager/add_reservation/add_resvervation.dart';
import 'package:petrol_pump/ui/orderManager/add_reservation/resvertation_details.dart';
import 'package:petrol_pump/ui/orderManager/add_reservation/stepControlller.dart';

import '../../widgets/custom_appbar.dart';
import '../../widgets/drwaer.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({Key? key}) : super(key: key);

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  var stepCon=Get.put(StepController());
  bool isOpenDrawer = false;
  void toggleDrawer() {
    setState(() {
      isOpenDrawer = !isOpenDrawer;
    });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        isOpenDrawer = false;
        setState(() {});
      },
      child: GetBuilder(
        init: stepCon,
        builder: (_) {
          return Scaffold(
            body: Stack(
              children: [
                Container(

                  margin: EdgeInsets.only(
                    top: 50.h,
                    left: Get.width * 0.05,
                    right:  Get.width * 0.05,

                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      custom_appbar(context, toggleDrawer),
                      SizedBox(height: 15.h),
                      Text("Add Resveration",style: Theme.of(context).textTheme.bodyLarge,),
                      Expanded(
                          child:Container(
                            width: 0.90.sw,
                            child: Stepper(

                              margin: EdgeInsets.zero,
                              connectorThickness: 2,
                              connectorColor: MaterialStateProperty.resolveWith((states) {
                                if (states.contains(MaterialState.disabled)) {
                                  return connectorColor; // Color for the disabled state
                                }
                                return darkcolor; // Default color
                              }),
                              controlsBuilder: (BuildContext context, ControlsDetails details) {
                                return Row(
                                  children: [
                                    ]
                                );
                              },
                              elevation: 1000,
                              type: StepperType.horizontal, // Use horizontal type
                              currentStep: stepCon.currentstep, // Use a variable to track the current step
                              onStepTapped: (step) {
                                stepCon.currentstep=step;
                                setState(() {
                                });
                              },
                              steps: [
                                Step(
                                  title: Text(""),
                                  content: Container(
                                    width: 0.90.sw,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow:shadow,
                                      borderRadius: BorderRadius.circular(10.w),
                                    ),
                                    child: AddResvervation(
                                    ),
                                  ),
                                  isActive: stepCon.currentstep>=0, // You can set isActive as needed
                                ),
                                Step(
                                  title: Text(''),
                                  content: reservationDetails(context),
                                  isActive: stepCon.currentstep >= 1,
                                ),
                                Step(
                                  title: Text(''),
                                  content: Column(
                                    children: [
                                     ElevatedButton(onPressed: (){
                                       stepCon.step(0);
                                       setState(() {

                                       });
                                     }, child: Text("Previos"))
                                      // Add your custom content for Step 3 here
                                    ],
                                  ),
                                  isActive: stepCon.currentstep >= 2,
                                ),
                              ],
                            ),
                          )
                      )
                    ],
                  ),
                ),
                isOpenDrawer
                    ? Container(
                  width: Get.width * 0.75,
                  child: CustomSideBar(), // Replace with your custom sidebar widget.
                )
                    : Container(),
              ],
            ),
          );
        }
      ),
    );
  }
}
