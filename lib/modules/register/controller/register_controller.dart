import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sellproducts/api/register_api.dart';
import 'package:sellproducts/constant/common.dart';
import 'package:sellproducts/constants/locals.g.dart';
import 'package:sellproducts/modules/login/login_controller/login_controller.dart';
import 'package:sellproducts/routes/app_pages.dart';

class RegisterController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();



  RxBool isLoad = false.obs;

  registerUser(int iSelect) async {
    if(await Get.find<LoginScreenController>().checkInternet()==true)
      {
        isLoad.value = true;
    Map<String, dynamic> body = {
      "username": usernameController.text,
      "mobileNumber": mobileController.text,
      "email": emailController.text,
      "password": confirmPassController.text,
      "role": iSelect,
    };

    await RegisterApi.RegisterUserApi(body).then((value){
      if(value!=null)
        {
          Get.toNamed(Routes.LANGUAGE_VIEW);
          usernameController.text = "";
          mobileController.text = "";
          emailController.text = "";
          confirmPassController.text = "";
        }

    });
    isLoad.value = false;

  }
    else
      {
        flutterToastBottom(LocaleKeys.checkInternet);
      }
  }
}
