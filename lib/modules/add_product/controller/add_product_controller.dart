import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sellproducts/api/add_product_api.dart';
import 'package:sellproducts/constant/pref_service.dart';
import 'package:sellproducts/constants/locals.g.dart';

class AddProductController extends GetxController {
  TextEditingController brandNameController = TextEditingController();
  TextEditingController productNameController = TextEditingController();
  TextEditingController originalPriceController = TextEditingController();
  TextEditingController salePriceController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();

  RxBool isLoad = false.obs;

  productAdd() async {
    Map<String, dynamic> body = {
      "userId": PrefService.getString(LocaleKeys.SPUserId),
      "image_id": "1",
      "seller_brand_name": brandNameController.text,
      "product_name": productNameController.text,
      "original_price": originalPriceController.text,
      "sale_price": salePriceController.text,
      "product_description": productDescriptionController.text
    };

    isLoad.value = true;

    await AddProductApi.addProductApi(body);

    isLoad.value = false;
  }
}
