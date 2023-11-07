import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../theameConstants.dart';
import '../../useers/loginScreen.dart';
import 'boardingWeigits.dart';

class Boarding extends StatefulWidget {
  const Boarding({Key? key}) : super(key: key);

  @override
  State<Boarding> createState() => _BoardingState();
}

class _BoardingState extends State<Boarding> {
  final _controller = PageController();
  bool onlastPage=false;
  var active=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          //Page View
          PageView(
            onPageChanged: (index){
              setState(() {
                onlastPage=(index==1);
               active=index;
              });
            },
            controller: _controller,
            children: <Widget>[
              // First view
              boardingScreenOne(context),
              // Second view
              boardingScreentwo(context),
            ],
          ),

          //Smoth page Indicator
          Container(
              alignment: Alignment(0,0.65),
              child: SmoothPageIndicator(
                controller: _controller, count: 2,
                effect:  ExpandingDotsEffect(
                  spacing:  8.0,
                  expansionFactor: 2,
                  radius: 16.0,
                  dotWidth:  25,
                  dotHeight:  10.0,
                  paintStyle:  PaintingStyle.fill,
                  strokeWidth:  0.1,
                  dotColor:  Colors.white,
                  activeDotColor:  Colors.white,
                ),
              )
          ),
          //Next Button
          Positioned(
            bottom: 40,
            child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: Colors.white, // Set the border color here
                    width: 2.0, // Set the border width
                  ),
                ),
                child:IconButton(
                  onPressed: (){
                    onlastPage?Get.to(()=>LoginScreen()):_controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
                  },
                  icon: Icon(Icons.arrow_forward,color: Colors.white,),
                )),
          ),

          //Skip button
          Positioned(
              right: 0,
              top: 50,
              child: TextButton(
                onPressed: (){
                  Get.to(()=>LoginScreen(),transition: Transition.fadeIn,duration: Duration(milliseconds: 500));
                },
                child: Text("Skip",style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: darkcolor,fontWeight: FontWeight.bold),),
              )),


        ],
      ),
    );
  }
}