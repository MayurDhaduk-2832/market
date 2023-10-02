
// ignore_for_file: invalid_use_of_protected_member

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sellproducts/constant/pref_service.dart';
import 'package:sellproducts/constants/locals.g.dart';

class ProfileScreenController extends GetxController{

  dynamic argumentData = Get.arguments;
  int iSelect = 0;
  RxInt iSelected = 1.obs;
  RxBool isSelectedImage = false.obs;
  XFile? image;
  File? imageFile;
  RxList profileList=[
    LocaleKeys.yourName,
    LocaleKeys.yourMobileNo,
    LocaleKeys.yourEmail,
    LocaleKeys.yourAddress,
  ].obs;
  final ImagePicker picker = ImagePicker();
  RxList<TextEditingController> profileController = RxList<TextEditingController>([]);

  // TextEditingController userNameController =TextEditingController();
  // TextEditingController mobileController =TextEditingController();
  // TextEditingController emailController =TextEditingController();
  // TextEditingController passwordController =TextEditingController();
  // TextEditingController addressController =TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    if (argumentData != null && argumentData is Map<String, dynamic>) {
      iSelect = argumentData['setIndex'];
    }
    profileController.value = List.generate(profileList.length, (index) => TextEditingController());
    getLoginData();
  }

  getLoginData()
  {
        profileController.value[0].text =PrefService.getString(LocaleKeys.SPUserName);
        profileController.value[1].text =PrefService.getString(LocaleKeys.SPUserMobile);
        profileController.value[2].text =PrefService.getString(LocaleKeys.SPUserEmail);

  }

}