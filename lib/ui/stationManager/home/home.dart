
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:petrol_pump/theameConstants.dart';
import 'package:petrol_pump/ui/stationManager/widgets/drwaer.dart';
import 'package:petrol_pump/ui/widgets/custom_appbar.dart';

import '../../../models/station_manager.dart';
import '../../widgets/custom_botton.dart';
import '../widgets/textFieldDecoration.dart';
import 'dropdownController.dart';
class HomeScrenStation extends StatefulWidget {
  const HomeScrenStation({Key? key}) : super(key: key);

  @override
  State<HomeScrenStation> createState() => _HomeScrenStationState();
}

class _HomeScrenStationState extends State<HomeScrenStation> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final FuelTypeController fuelTypeController = Get.put(FuelTypeController());
  var text=TextEditingController();
  int selectedOption = 0;

  List<String> fueltype=["91","92","93","D"];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: CustomSideBarStationManager(),
      key: scaffoldKey,
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20,left: 20,right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 20,),
                custom_appbar(context, scaffoldKey,"Home"),
                SizedBox(height: 20,),
                Text("Station MCJD_1016",style: Theme.of(context).textTheme.bodyLarge,),
                SizedBox(height: 20,),
                _fueltype(),
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget _fueltype(){
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 1,
      itemBuilder: (context,index){
        var station = dummyStations[index];
        return Container(
          margin: EdgeInsets.only(bottom: 25.h,left: 10.h,right: 10.h),
          padding: EdgeInsets.only(left: 10.h,right: 10.h),
          height: 0.3.sh,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            border: Border.all(color: btnColor,width: 1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Avaible Fuel",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Divider(thickness: 2,)),
              Row(
                children: [
                  Text("${station.fuelType.toString().split(".").last}     ",style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),),
                  Text("${station.prices[station.fuelType]}",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 15, fontWeight: FontWeight.normal, color: darkcolor)),
                ],
              ),
              SizedBox(height: 5.h,),
              Row(
                children: [
                  Text("${station.fuelType.toString().split(".").last}     ",style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),),
                  Text("${station.prices[station.fuelType]}",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 15, fontWeight: FontWeight.normal, color: darkcolor)),
                ],
              ),
              SizedBox(height: 5.h,),
              Row(
                children: [
                  Text("${station.fuelType.toString().split(".").last}     ",style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.bold),),
                  Text("${station.prices[station.fuelType]}",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 15, fontWeight: FontWeight.normal, color: darkcolor)),
                ],
              ),
              SizedBox(height: .08.sh,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  custom_botton1(context,onpress: (){
                    _bottomsheet(context);
                  },titile: "New Side",icon: Icons.add),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
  _bottomsheet(BuildContext context){
    return showModalBottomSheet(context: context, builder: (_) {
      return SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              color: darkcolor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
          ),
          padding: EdgeInsets.all(20),
          child: Column(
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
              SizedBox(height: 20,),
              Divider(thickness: 2),
              SizedBox(height: 20,),
              Container(
                  color: darkcolor,
                  margin: EdgeInsets.all(15),
                  alignment: Alignment.center,
                  child: Text("Sell Fuel",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: backgroundColor,fontWeight: FontWeight.bold),)),
              //Data
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  custom_textField(),
                  SizedBox(height: 20,),
                  TextFormField(
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: textFieldDecoration(context: context,label: "Amount",hint: "2000")
                  )

                ],
              )
            ],
          ),
        ),
      );
    });
  }
  Widget custom_textField(){
    return GestureDetector(
      onTap: (){
        showDialog(
          context: context,
          builder: (context) {
            return dropdown(context);
          },
        );
      },
      child: TextFormField(
        controller: text,
        enabled: false,
        cursorColor: Colors.white,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white),
        decoration: textFieldDecoration(context: context,label: "Fuel Type",hint: "Please choose FuelType...",icon: Icon(Icons.keyboard_arrow_down)),
      ),
    );
  }
  Widget dropdown(context){
    return GetBuilder(
        init: fuelTypeController,
        builder: (_) {
          return AlertDialog(
            alignment: Alignment.bottomCenter,
            scrollable: true,
            elevation: 0,
            backgroundColor: Colors.white,
            title: Center(
              child: Text(
                "Are you sure?",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            content: Container(
              child: Column(
                children: [
                  Divider(),
                  for(var i=0;i<fueltype.length;i++)
                    Row(
                      children: [
                        Radio(
                          activeColor: darkcolor,
                          value: i,
                          groupValue: fuelTypeController.selectedOption.value,
                          onChanged: (val) {
                              fuelTypeController.updateSelectedOption(val!);
                              text.text= fueltype[val];
                              setState(() {
                              });
                          },
                        ),
                        Text(fueltype[i]),
                      ],
                    ),
                  ElevatedButton(onPressed: (){
                    Navigator.pop(context);
                    setState(() {
                      selectedOption=fuelTypeController.selectedOption.value;
                      setState(() {
                      });
                    });
                  }, child: Text("Select"))
                ],
              ),
            ),
          );
        }
    );
  }
}
