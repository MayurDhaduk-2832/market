import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sellproducts/customs/custom_search_textfield.dart';
import 'package:sellproducts/customs/custome_back_button.dart';
import 'package:sellproducts/modules/category/category_controller/category_controller.dart';
import 'package:sellproducts/modules/home/home_controller/home_controller.dart';

class CategoryScreen extends StatelessWidget {
   CategoryScreen({super.key});

  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  CategoryScreenController categoryScreenController = Get.put(CategoryScreenController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.brown.shade50,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          color: Colors.brown.shade50,
          child: Stack(
            children: [

              Padding(
                padding: EdgeInsets.only(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ButtonCommonWidget(onTap: () {
                      Get.back();
                    },),
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.06, right: width * 0.06),
                      child: SearchTextFieldCommonWidget(
                        onChanged: (query) {
                          categoryScreenController.searchCategory(query: query ?? "");
                        },
                        controller: categoryScreenController.searchController,
                        hintText: "Search Product...",
                      ),
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.06, right: width * 0.06),
                      child: Text(
                        "All Category",
                        style: TextStyle(
                            fontSize: width * 0.05,
                            fontFamily: "Lalezar",
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Obx(
                        ()=> Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: width * 0.06, right: width * 0.06),
                          child: GridView.builder(
                            physics: BouncingScrollPhysics(),
                            itemCount: categoryScreenController.categoryModel.value.categories?.length ?? 0,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  categoryScreenController.selectedCategory.value = index;
                                },
                                child: Obx(
                                      () => Container(
                                    height: height * 0.100,
                                    width: width * 0.275,
                                    margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: index == categoryScreenController.selectedCategory.value
                                              ? Colors.black
                                              : Colors.white),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            spreadRadius: 0,
                                            offset: const Offset(0, 4),
                                            color: Colors.black.withOpacity(0.25),
                                            blurRadius: 4),
                                      ],
                                    ),
                                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                      Expanded(flex: 5,
                                        child: Container(height: height * 0.1, margin: EdgeInsets.all(5), decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: NetworkImage(
                                                  "https://mdprojects1203.000webhostapp.com/${ categoryScreenController.categoryModel.value.categories?[index].categoryImage ?? ""}")),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        ),
                                      ),
                                      Expanded(flex: 2, child: Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Text( categoryScreenController.categoryModel.value.categories?[index].category ?? "",
                                          style: TextStyle(fontSize: width * 0.03, fontWeight: FontWeight.w900),),
                                      )),
                                    ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Obx(() => categoryScreenController.isLoad.value == true
                  ? const Center(
                child: CupertinoActivityIndicator(
                    color: Colors.black, animating: true, radius: 12),
              )
                  : SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
