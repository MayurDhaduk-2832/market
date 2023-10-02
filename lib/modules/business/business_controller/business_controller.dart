import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class BusinessScreenController extends GetxController{

  RxList<String> allCategory=<String>[].obs;
  RxList<String> selectedCategory = <String>[].obs;
  RxList<String> CategoryImage = <String>[].obs;
  RxBool openKeyBoard = false.obs;
}