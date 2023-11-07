import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/custom_appbar.dart';
import '../widgets/drwaer.dart';

class NoticationScreen extends StatefulWidget {
  const NoticationScreen({Key? key}) : super(key: key);

  @override
  State<NoticationScreen> createState() => _NoticationScreenState();
}

class _NoticationScreenState extends State<NoticationScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


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
                custom_appbar(context,scaffoldKey,"Notifications"),
                SizedBox(height: 15.h),
                Text("General Notificatons",style: Theme.of(context).textTheme.bodyLarge,),
                SizedBox(height: 15,),

                for(var i=0;i<6;i++)
                  _notificaions()

              ],
            )
            //Topbar

          ],
        ),
      ),
    );
  }

  Widget _notificaions(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15.h,),
            Text("11",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),),
            Text("Sep",style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),),
          ],
        ),
        Column(
          children: [
            Container(
                alignment: Alignment.topLeft,
                width: 0.7.sw,
                child: Divider(thickness: 2,)),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Driver Xyz has accepted \nordered 50",style: Theme.of(context).textTheme.bodySmall,),
                SizedBox(width: 20.w,),
                Row(
                  children: [
                    Transform.scale(
                      scale: 0.8, // Adjust the scale factor to your desired size
                      child: Icon(Icons.watch_later_outlined),
                    ),
                    Text("9:00 AM",style: Theme.of(context).textTheme.bodySmall,),
                  ],
                )
              ],
            ),
          ],
        )
      ],
    );
  }

}
