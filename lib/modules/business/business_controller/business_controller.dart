import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sellproducts/api/business_add_api.dart';
import 'package:sellproducts/constant/common.dart';
import 'package:sellproducts/constant/pref_service.dart';
import 'package:sellproducts/constants/locals.g.dart';
import 'package:http/http.dart' as http;
import 'package:sellproducts/modules/login/login_controller/login_controller.dart';
import 'package:sellproducts/routes/app_pages.dart';

class BusinessScreenController extends GetxController {
  RxList<String> allCategory = <String>[].obs;
  RxList<String> selectedCategory = <String>[].obs;
  RxList<String> CategoryImage = <String>[].obs;
  RxBool openKeyBoard = false.obs;
  RxBool  isLoad = false.obs;
  RxString flagImage="".obs;

  final businessNameController = TextEditingController();
  final mobileController = TextEditingController();
  final addressController = TextEditingController();
  final whatsappLinkController = TextEditingController();
  final instagramLingController = TextEditingController();
  final pinCodeController = TextEditingController();

  final categorysController = TextEditingController();
  final countryController = TextEditingController();
  final stateController = TextEditingController();
  final cityController = TextEditingController();

  RxBool loader = false.obs;
  final ImagePicker picker = ImagePicker();
  XFile? image;

  int? imageId;
  dynamic uploadImage() async {
    isLoad.value = true;
    var request = http.MultipartRequest(
        'POST', Uri.parse(LocaleKeys.baseURL + LocaleKeys.uploadImage));
    request.fields
        .addAll({'userId': PrefService.getString(LocaleKeys.SPUserId)});
    request.files
        .add(await http.MultipartFile.fromPath('imagelogo', image?.path ?? ""));

    http.Response response =
        await http.Response.fromStream(await request.send());

    if (response.statusCode == 200) {
      imageId = jsonDecode(response.body)["insertedId"];
    } else {
      print(response.reasonPhrase);
    }
    isLoad.value = false;
  }

  imagePicker() async {
    ImagePicker picker = ImagePicker();

    image = await picker.pickImage(source: ImageSource.gallery);
  }

  addBusiness() async {
    isLoad.value = true;
    if(await Get.find<LoginScreenController>().checkInternet()==true)
      {
        Map<String, dynamic> body = {
      'user_id': PrefService.getString(LocaleKeys.SPUserId),
      'image_id':imageId.toString(),
      'bussiness_name': businessNameController.text,
      'contact_number': mobileController.text,
      'categorys': categorysController.text,
      'country': countryController.text,
      'state': stateController.text,
      'city': cityController.text,
      'address': addressController.text,
      'pincode': pinCodeController.text,
      'long': PrefService.getDouble(LocaleKeys.SPULongitude),
      'lat': PrefService.getDouble(LocaleKeys.SPULatitude),
    };

    await AddBusinessApi.addBusinessApi(body).then((value) {
      if(value!=null)
        {
          Get.offNamed(Routes.BOTTOM_VIEW);
          businessNameController.text = "";
          mobileController.text = "";
          categorysController.text = "";
          countryController.text = "";
          stateController.text = "";
          cityController.text = "";
          addressController.text = "";
          pinCodeController.text = "";
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
