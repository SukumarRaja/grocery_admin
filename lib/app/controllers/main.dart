import 'package:get/get.dart';

class MainController extends GetxController {
  static MainController get to => Get.put(MainController());

  var _selectPageIndex = 4.obs;

  get selectPageIndex => _selectPageIndex.value;

  set selectPageIndex(value) {
    _selectPageIndex.value = value;
  }
}
