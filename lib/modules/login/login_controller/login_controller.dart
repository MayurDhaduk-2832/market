import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:sellproducts/api/login_api.dart';
import 'package:sellproducts/constant/common.dart';
import 'package:sellproducts/constant/pref_service.dart';
import 'package:sellproducts/constants/locals.g.dart';
import 'package:sellproducts/modules/login/model/login_view_model.dart';
import 'package:sellproducts/routes/app_pages.dart';

class LoginScreenController extends GetxController {
  RxInt iSelect = 0.obs;
  Position? position;
  RxBool isLoad = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginModel loginModel = LoginModel();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("asknfsdfl");

    getLocation();
  }






  getLocation() async {
    bool _serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await Geolocator.openAppSettings();
      if (!_serviceEnabled) {
        return;
      }
    }

    LocationPermission _permissionGranted = await Geolocator.checkPermission();
    if (_permissionGranted == LocationPermission.denied) {
      _permissionGranted = await Geolocator.requestPermission();
      if (_permissionGranted != LocationPermission.always) {

        position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        PrefService.setValue(LocaleKeys.SPULatitude,position?.latitude);
        PrefService.setValue(LocaleKeys.SPULongitude,position?.longitude);
        debugPrint('------- Latitude:   ${position?.latitude},   ------- Longitude: ${position?.longitude}');

      }
    }


  }

  bool isEmailValid(String email) {
    final RegExp regex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return regex.hasMatch(email);
  }

  Future<bool> checkInternet() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult != ConnectivityResult.none) {
      return true; // There is an internet connection
    } else {
      return false; // There is no internet connection
    }
  }
  login() async {
    if(await checkInternet() == true)
      {
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
          else
          {
            flutterToastBottom("Incorrect password");
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
