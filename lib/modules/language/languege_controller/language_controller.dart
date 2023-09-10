
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LanguageScreenController extends GetxController{

  RxInt isSelectedLanguage = 0.obs;
  dynamic argumentData = Get.arguments;
  int iSelect = 0;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if (argumentData != null && argumentData is Map<String, dynamic>) {
      iSelect = argumentData['setIndex'];
    }
  }


}