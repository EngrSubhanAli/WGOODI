import 'package:get/get.dart';

class OrderedFilterController extends GetxController{
  RxBool orderbtn=true.obs;
  RxBool enroutebtn=false.obs;
  RxBool dilveredbtn=false.obs;
  RxBool approvedbtn=false.obs;
  ordered(){
    orderbtn.value=true;
    enroutebtn.value=false;
    approvedbtn.value=false;
    dilveredbtn.value=false;
    update();
  }
  en_route(){
    orderbtn.value=false;
    enroutebtn.value=true;
    approvedbtn.value=false;
    dilveredbtn.value=false;
    update();
  }
  dilvered(){
    orderbtn.value=false;
    enroutebtn.value=false;
    approvedbtn.value=false;
    dilveredbtn.value=true;
    update();
  }
  approved(){
    orderbtn.value=false;
    enroutebtn.value=false;
    approvedbtn.value=true;
    dilveredbtn.value=false;
    update();
  }

}