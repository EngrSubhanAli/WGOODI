import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:petrol_pump/theameConstants.dart';
import 'package:petrol_pump/ui/driver/widgets/sidebar_driver.dart';
import 'package:petrol_pump/ui/widgets/custom_appbar.dart';

import '../widgets/dialogBox _enrouteorder.dart';
import '../widgets/dotted_line.dart';

class EnRouteOrderScreen extends StatefulWidget {
  const EnRouteOrderScreen({Key? key}) : super(key: key);

  @override
  State<EnRouteOrderScreen> createState() => _EnRouteOrderScreenState();
}

class _EnRouteOrderScreenState extends State<EnRouteOrderScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  static const LatLng sourceLocation = LatLng(33.6844, 73.0479);
  static const LatLng destination = LatLng(33.7737, 72.2357);

  Set<Marker> _markers = Set<Marker>();
  Set<Polyline> _polylines = Set<Polyline>();

  @override
  void initState() {
    super.initState();

    _markers.add(
      Marker(
        markerId: MarkerId("source"),
        position: sourceLocation,
      ),
    );
    _markers.add(
      Marker(
        markerId: MarkerId("destination"),
        position: destination,
      ),
    );

    // Create a polyline to connect source and destination
    _polylines.add(
      Polyline(
        polylineId: PolylineId("route"),
        color: Colors.blue, // You can customize the color
        width: 5, // You can customize the line width
        points: [sourceLocation, destination], // List of LatLng points
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: CustomSideBarDriver(),
      body: Stack(
        children: [
          Container(
            width: 1.sw,
            //it must be one
            height: 1.sh,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(target: sourceLocation, zoom: 14.5),
              mapType: MapType.normal,
              markers: _markers,
              polylines: _polylines,
            ),
          ),
          Positioned(
              left: 15,
              right: 15,
              top: 40.h,
              child: custom_appbar(context, scaffoldKey, "En Route Orders")),
      DraggableScrollableSheet(
        shouldCloseOnMinExtent: true,
        initialChildSize: 0.45,
        minChildSize: 0.08,
        maxChildSize: 0.45,
        builder: (context, controller) => SingleChildScrollView(
          controller: controller,
          child: Container(
            margin: EdgeInsets.only(right: 0.07.sw,left: 0.08.sw,bottom: 0.01.sh),
            width: 0.85.sw,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: darkcolor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 10,right: 10,top: 7,bottom: 7),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        const CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://picsum.photos/200/300'),
                        ),
                        SizedBox(width: 10,),
                        Column(
                          children: [
                            Text("Karan",style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold,color: Colors.white),),
                            Row(
                              children: [
                                Text("4.9",style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white)),
                                Icon(Icons.star, color: Colors.yellow),

                              ],
                            ),
                          ],
                        ),
                      ],),


                      Row(children: [
                        Icon(Icons.file_download_outlined,color: Color(0xFFCFCFCF),size: 22.h,),
                        Icon(Icons.add, color: Color(0xFFCFCFCF), size: 22.0.h),

                      ],)
                    ],
                  ),
                ),
                Divider(thickness: 1,color: Colors.white,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 0.15.sw,
                      height: 0.1.sh,
                      child: Column(
                        children: [
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

                          SizedBox(height: 5,),
                          Container(
                            width: 50,
                            child: Transform.rotate(
                              angle: 90 * (3.141592653589793 / 180), // 90 degrees in radians
                              child: DottedDivider(
                                dashCount: 5,
                                color: Colors.white,
                                height: 5.0,
                              ),
                            ),

                          ),
                          SizedBox(height: 20,),
                          Icon(Icons.location_on,color: Colors.red,)
                        ],
                      ),
                    ),
                    Container(
                      width: 0.7.sw,
                      height: 0.1.sh,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(),
                          Text("S123",style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold,color: Colors.white),),
                          Divider(thickness: 2,color: Colors.white,),
                          Text("MCJD-123",style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold,color: Colors.white),),
                          SizedBox()

                        ],
                      ),
                    ),

                  ],
                ),
                Divider(thickness: 1,color: Colors.white,),
                SizedBox(height: 10.h,),

                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/icons/car.png",height: 20.h,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Distance",style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Text("0.2 Km",style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white),),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Time",style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Text("20 min",style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white),),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Price",style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white,fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Text("\$200",style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white),),
                        ],
                      ),
                      SizedBox()

                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                      ),
                      width:0.4.sw,
                      child: ElevatedButton(onPressed: (){}, child: Text("Pickup",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 18.sp ),),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          )
                      ),
                    ),
                    Container(
                      width:0.3.sw,
                      decoration: BoxDecoration(
                      ),
                      child: ElevatedButton(onPressed: ()async{
                        await dilog_cancel_dragableView(context);
                      }, child: Text("Cancel",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold,color: btnColor,fontSize: 18.sp ),),
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(Colors.white),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          )
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15.h,)
              ],
            ),
          ),
        ),
      )],
      ),
    );
  }
}
