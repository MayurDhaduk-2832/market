import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:sellproducts/api/add_product_api.dart';
import 'package:sellproducts/api/login_api.dart';
import 'package:sellproducts/constant/common.dart';
import 'package:sellproducts/constant/pref_service.dart';
import 'package:sellproducts/constants/locals.g.dart';
import 'package:sellproducts/modules/login/model/login_view_model.dart';
import 'package:sellproducts/routes/app_pages.dart';

class LoginScreenController extends GetxController {
  RxInt iSelect = 0.obs;
  RxBool isLoad = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginModel loginModel = LoginModel();

  login() async {
    isLoad.value = true;
    Map<String, dynamic> body = {
      'email': emailController.text,
      'password': passwordController.text,
    };
    await LoginApi.loginApi(body).then((value){
       if(value!=null)
         {
           loginModel = value;
           PrefService.setValue(LocaleKeys.SPIsLogin, true);
           PrefService.setValue(LocaleKeys.SPUserName, loginModel.username ?? "");
           PrefService.setValue(LocaleKeys.SPUserId, loginModel.id ?? "");
           PrefService.setValue(LocaleKeys.SPUserRole, loginModel.role ?? "");
           PrefService.setValue(LocaleKeys.SPUserMobile, loginModel.mobileNumber ?? "");
           PrefService.setValue(LocaleKeys.SPUserEmail, loginModel.email ?? "");
           if(loginModel.isSuccess==true)
             {
               Get.toNamed(Routes.LANGUAGE_VIEW);
               emailController.text ="";
               passwordController.text ="";
             }
           else
             {
               flutterToastBottom("Incorrect password");
             }
         }
    });
    isLoad.value = false;

  }
}
