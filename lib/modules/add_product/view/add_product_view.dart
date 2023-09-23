import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sellproducts/modules/add_product/controller/add_product_controller.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    AddProductController addProductController = Get.put(AddProductController());
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(

      body: Container(
        height: height,
        width: width,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
        child: SingleChildScrollView(
          child: Column(children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: height * 0.06,
                  width: height * 0.06,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  alignment: Alignment.center,
                  child:  Icon(Icons.arrow_back,size: width * 0.05),
                ),
              ),
            ),
            Container(
              height: height * 0.55,
              width: width * 0.85,
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 8,
                        offset: Offset(0, 5))
                  ]),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.grey.shade200,
                      width: 4,
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 5,
                          offset: Offset(0, 5))
                    ],
                    borderRadius: BorderRadius.circular(15)),
                child: PageView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: height * 0.06,
                              width: height * 0.06,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade400,
                                  borderRadius: BorderRadius.circular(20)),
                              child:  Icon(
                                Icons.add,
                                color: Colors.white,
                                size: width * 0.05,
                              ),
                            ),
                            SizedBox(
                              height: height * 0.03,
                            ),
                             Text("Add Image",style: TextStyle(fontSize: width * 0.04)),
                          ]),
                    );
                  },
                ),
              ),
            ),
            Container(
              height: height * 0.065,
              width: width * 0.85,
              padding: EdgeInsets.symmetric(horizontal: width * 0.02),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5,
                        offset: Offset(0, 5),
                        color: Colors.black.withOpacity(0.3))
                  ]),
              child:  Row(
                children: [
                  Expanded(
                      child: TextField(controller:addProductController.brandNameController ,style: TextStyle(fontSize: width * 0.04),
                    decoration: InputDecoration(hintStyle: TextStyle(fontSize: width * 0.04),
                        border: InputBorder.none,
                        hintText: "Enter brand name*"),
                  )),
                   Icon(Icons.add,size: width * 0.06,),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.025,
            ),
            Container(
              height: height * 0.065,
              width: width * 0.85,
              padding: EdgeInsets.symmetric(horizontal: width * 0.02),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5,
                        offset: Offset(0, 5),
                        color: Colors.black.withOpacity(0.3))
                  ]),
              child:  Row(
                children: [
                  Expanded(
                      child: TextField(controller: addProductController.productNameController,style: TextStyle(fontSize: width * 0.04),
                    decoration: InputDecoration(hintStyle: TextStyle(fontSize: width * 0.04),
                        border: InputBorder.none, hintText: "Product name*"),
                  )),
                  Icon(Icons.add,size: width * 0.06,),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.025,
            ),
            Row(
              children: [
                Container(
                 margin: EdgeInsets.symmetric(horizontal: (width > 600)? width * 0.04:width * 0.02),
                  height: height * 0.065,
                  width: width * 0.13,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5,
                            offset: const Offset(0, 5),
                            color: Colors.black.withOpacity(0.3))
                      ]),
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(style: TextStyle(fontSize: width * 0.04),
                        "Rs",
                      ),
                       Icon(Icons.keyboard_arrow_down_rounded,size: width * 0.06,)
                    ],
                  ),
                ),
                SizedBox(
                  width: width * 0.01,
                ),
                Container(
                  height: height * 0.065,
                  width: width * 0.35,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5,
                            offset: Offset(0, 5),
                            color: Colors.black.withOpacity(0.3))
                      ]),
                  child: TextField(style: TextStyle(fontSize: width * 0.04),controller: addProductController.salePriceController,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Sale price*",hintStyle: TextStyle(fontSize: width * 0.04))),
                ),
                SizedBox(
                  width: width * 0.01,
                ),
                Container(
                  height: height * 0.065,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: width * 0.35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5,
                            offset: Offset(0, 5),
                            color: Colors.black.withOpacity(0.3))
                      ]),
                  child: TextField(style: TextStyle(fontSize: width * 0.04),controller: addProductController.originalPriceController,
                      decoration: InputDecoration(
                          border: InputBorder.none,hintStyle: TextStyle(fontSize: width * 0.04),
                          hintText: "Original price*")),
                )
              ],
            ),
            SizedBox(
              height: height * 0.025,
            ),
            Container(
              height: height * 0.2,
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: width * 0.85,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 5,
                        offset: Offset(0, 5),
                        color: Colors.black.withOpacity(0.3))
                  ]),
              child: TextField(controller: addProductController.productDescriptionController,style: TextStyle(fontSize: width * 0.04),
                  maxLines: 5,
                  decoration: InputDecoration(hintStyle: TextStyle(fontSize: width * 0.04),
                      border: InputBorder.none,
                      hintText: "Product discription")),
            ),
            SizedBox(
              height: height * 0.025,
            )
          ]),
        ),
      ),
    );
  }
}
