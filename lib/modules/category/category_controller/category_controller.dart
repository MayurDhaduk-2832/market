import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:sellproducts/api/search_category_api.dart';
import 'package:sellproducts/modules/home/home_controller/home_controller.dart';
import 'package:sellproducts/modules/home/model.dart';

class CategoryScreenController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxInt selectedCategory = 50.obs;
  // final categoryModel = CategoryModel();
  RxBool isLoad = false.obs;
  var categoryModel=CategoryModel().obs;
  RxList<Category> filteredCategories = RxList<Category>();
  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    searchCategory(query: "");
  }



  Future<void> searchCategory({query}) async {
    isLoad.value = true;
    Map<String, dynamic> body = {
      "search": query,
    };
    // Check if the API response is not null before assignment
    final response = await SearchCategoryApi.searchCategoryApi(search: body);
    if (response != null) {
      categoryModel.value = response;
    }

    isLoad.value = false;
  }

}


