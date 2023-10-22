import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sellproducts/customs/custom_search_textfield.dart';
import 'package:sellproducts/customs/custome_back_button.dart';
import 'package:sellproducts/modules/search_product/searchProducts_controller/search_products_controller.dart';

class SearchProductsScreen extends StatelessWidget {
   SearchProductsScreen({super.key});

   SearchProductsScreenController searchProductsScreenController = Get.put(SearchProductsScreenController());

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
              GetBuilder<SearchProductsScreenController>(id:"searchProduct",
                builder: (context) {
                  return Padding(
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
                              searchProductsScreenController.searchCategory(query: query ?? "");
                            },
                            controller: searchProductsScreenController.searchController.value,
                            hintText: "Search Product...",
                          ),
                        ),
                        SizedBox(
                          height: height * 0.04,
                        ),

                         Obx(
                             ()=> Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(left: width * 0.06, right: width * 0.06),
                                child:searchProductsScreenController.searchController.value.text.isNotEmpty?
                               ListView.separated(itemCount: searchProductsScreenController.searchProductsModel.value.data?.length ?? 0,
                                  itemBuilder: (context, index) {
                                  return  ListTile(tileColor: Colors.white,splashColor: Colors.white,leading: const CircleAvatar(backgroundColor: Colors.transparent
                                      ,backgroundImage: AssetImage("assets/shose.jpg")),
                                    title: Text(searchProductsScreenController.searchProductsModel.value.data?[index].productName ?? ""),
                                  );
                                }, separatorBuilder: (BuildContext context, int index) {
                                  return SizedBox(height: 5,);
                                  },):Center(child: Text("Please Search Producs....")),
                              )
                            ),
                         ),

                      ],
                    ),
                  );
                }
              ),
              Obx(() => searchProductsScreenController.isLoad.value == true
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
