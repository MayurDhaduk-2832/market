
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:sellproducts/api/add_product_api.dart';

class LoginScreenController extends GetxController{

  RxInt iSelect = 0.obs;
  RxBool isLoad = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();


}