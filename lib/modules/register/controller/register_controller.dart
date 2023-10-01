import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sellproducts/api/register_api.dart';

class RegisterController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();



  RxBool isLoad = false.obs;

  registerUser(int iSelect) async {
    Map<String, dynamic> body = {
      "username": usernameController.text,
      "mobileNumber": mobileController.text,
      "email": emailController.text,
      "password": confirmPassController.text,
      "role": iSelect,
    };

    isLoad.value = true;

    await RegisterApi.RegisterUserApi(body);

    isLoad.value = false;
  }
}
