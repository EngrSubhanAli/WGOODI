import 'package:get/get.dart';

class StepController extends GetxController{
 int currentstep=0;
 void step(index){
  currentstep=index;
  update();
 }

}