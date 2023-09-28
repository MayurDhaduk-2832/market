import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:sellproducts/api/business_add_api.dart';
import 'package:sellproducts/constant/pref_service.dart';
import 'package:sellproducts/constants/locals.g.dart';

class BusinessScreenController extends GetxController {
  RxList<String> allCategory = <String>[].obs;
  RxList<String> selectedCategory = <String>[].obs;
  RxBool openKeyBoard = false.obs;

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

  addBusiness() async {
    Map<String, dynamic> body = {
      'user_id': PrefService.getString(LocaleKeys.SPUserId),
      'bussiness_name': businessNameController.text,
      'contact_number': mobileController.text,
      'categorys': categorysController.text,
      'country': countryController.text,
      'state': stateController.text,
      'city': cityController.text,
      'address': addressController.text,
      'pincode': pinCodeController.text,
      'long': 20.1234,
      'lat': 20.1452,
    };

    await AddBusinessApi.addBusinessApi(body);
  }
}
