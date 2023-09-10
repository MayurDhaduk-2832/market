// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sellproducts/AllStatic/color.dart';
import 'package:sellproducts/constants/locals.g.dart';
import 'package:sellproducts/customs/custom_search_textfield.dart';
import 'package:sellproducts/modules/business/viewmodel/business_insert_viewmodel.dart';
import 'package:sellproducts/routes/app_pages.dart';

class MoreProductsScreen extends StatefulWidget {
  const MoreProductsScreen({super.key});

  @override
  State<MoreProductsScreen> createState() => _MoreProductsScreenState();
}

class _MoreProductsScreenState extends State<MoreProductsScreen> {
  final searchController = TextEditingController();
  int currentIndex = 0;
  String saleName="";
  dynamic argumentData = Get.arguments;
  late BusinessCreateViewModel _service;
  List<String> imageList = [
    "assets/shose.jpg",
    "assets/tshirt.jpg",
    "assets/watch.jpg",
    "assets/car.jpg"
  ];

  @override
  void initState() {
    super.initState();
    // _service = BusinessCreateViewModel(context);
    if (argumentData != null && argumentData is Map<String, dynamic>) {
      saleName = argumentData['saleName'];
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:Colors.brown.shade50,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          color:   Colors.brown.shade50,
          child: Padding(
            padding: EdgeInsets.only(top: height * 0.02),
            child: SingleChildScrollView(physics: NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: width * 0.06, right: width * 0.06),
                    child:SearchTextFieldCommonWidget(controller: searchController,hintText: "Search Product..."),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: width * 0.06, right: width * 0.06),
                    child: Text(
                      saleName,
                      style: TextStyle(
                          fontSize: width * 0.05,
                          fontFamily: "Lalezar",
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  SizedBox(
                    height: height,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: width * 0.06, right: width * 0.06),
                            child: SizedBox(
                              height: height * 0.67,
                              width: double.infinity,
                              child: GridView.builder(
                                // physics: NeverScrollableScrollPhysics(),
                                itemCount: 100,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 1,
                                        crossAxisSpacing: 15,
                                        childAspectRatio: 0.8),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.PRODUCT_VIEW);
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: width * 0.450,
                                      margin:
                                          EdgeInsets.symmetric(vertical: 5),
                                      decoration: BoxDecoration(
                                        //   image: DecorationImage(image: AssetImage(imageList[index])),
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                              spreadRadius: 0,
                                              // blurStyle: BlurStyle.outer,
                                              offset: Offset(0, 4),
                                              color: Colors.black
                                                  .withOpacity(0.25),
                                              blurRadius: 4)
                                        ],
                                      ),
                                      child: Text("$index"),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.08,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
