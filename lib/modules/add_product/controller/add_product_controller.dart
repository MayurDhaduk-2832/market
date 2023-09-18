import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sellproducts/network/base_api_service.dart';

class AddProductController extends GetxController {
  TextEditingController brandNameController = TextEditingController();
  TextEditingController productNameController = TextEditingController();
  TextEditingController originalPriceController = TextEditingController();
  TextEditingController salePriceController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
}

class AddProductViewModel extends BaseApiService {
  AddProductViewModel(super.context);

  addProduct() {
    client.addProduct(
        user_id: "",
        seller_brand_name: "",
        product_name: "",
        original_price: "",
        sale_price: "",
        product_description: "");
  }
}
