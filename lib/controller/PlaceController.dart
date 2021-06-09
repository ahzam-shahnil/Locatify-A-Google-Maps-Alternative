import 'package:get/get.dart';

class PlaceController extends GetxController {
  var place = <double>[37.0902, 95.7129].obs;

  @override
  void onInit() {
    super.onInit();
    // defaultValues();
  }

  updateValue({required var latV, required var lngV}) {
    place.clear();
    place.assignAll([latV, lngV]);
  }

  defaultValues() {
    place[0] = 37.0902;
    place[1] = 95.7129;
  }
}
