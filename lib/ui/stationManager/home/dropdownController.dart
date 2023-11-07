import 'package:get/get.dart';

class FuelTypeController extends GetxController {
  RxInt selectedOption = 0.obs; // Initialize with the default selected option

  int updateSelectedOption(int value) {
    selectedOption.value = value;
    update();
    return selectedOption.value;
  }
}