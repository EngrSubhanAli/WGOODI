import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:petrol_pump/theameConstants.dart';
import 'package:petrol_pump/ui/orderManager/add_reservation/add_resvervation.dart';
import 'package:petrol_pump/ui/orderManager/add_reservation/resvertation_details.dart';
import 'package:petrol_pump/ui/orderManager/add_reservation/stepControlller.dart';

import '../../widgets/custom_appbar.dart';
import '../widgets/drwaer.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({Key? key}) : super(key: key);

  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  var stepCon = Get.put(StepController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: stepCon,
      builder: (_) {
        return Scaffold(
          drawer: CustomSideBar(),
          key: scaffoldKey,
          body: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 30.h,
                  left: Get.width * 0.04,
                  right: Get.width * 0.04,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    custom_appbar(context, scaffoldKey,"Add Reservation"),
                    SizedBox(height: 15.h),
                    Text(stepCon.currentstep==0?"Add Reservation":stepCon.currentstep==1?"Reservation Details":"Ordered Placed", style: Theme.of(context).textTheme.bodyLarge),
                    Container(
                      height: 1.sh,
                      child: Stepper(
                        physics: NeverScrollableScrollPhysics(),
                        margin: EdgeInsets.zero,
                        connectorThickness: 2,
                        connectorColor: MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.disabled)) {
                            return connectorColor; // Color for the disabled state
                          }
                          return darkcolor; // Default color
                        }),
                        controlsBuilder: (BuildContext context, ControlsDetails details) {
                          return Row(children: []);
                        },
                        elevation: 1000,
                        type: StepperType.horizontal,
                        currentStep: stepCon.currentstep,
                        onStepTapped: (step) {
                          stepCon.currentstep = step;
                          setState(() {});
                        },
                        steps: [
                          Step(
                            title: Text(""),
                            content: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: shadow,
                                borderRadius: BorderRadius.circular(10.w),
                              ),
                              child: addReservation(context, _formKey),
                            ),
                            isActive: stepCon.currentstep >= 0,
                          ),
                          Step(
                            title: Text(''),
                            content: Container(

                                child: reservationDetails(context)),
                            isActive: stepCon.currentstep >= 1,
                          ),
                          Step(
                            title: Text(''),
                            content: Column(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    stepCon.step(0);
                                    setState(() {});
                                  },
                                  child: Text("Previous"),
                                ),
                                // Add your custom content for Step 3 here
                              ],
                            ),
                            isActive: stepCon.currentstep >= 2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
