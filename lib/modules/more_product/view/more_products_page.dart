// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sellproducts/AllStatic/color.dart';
import 'package:sellproducts/constants/locals.g.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: LocalKeyColor.BackgroundColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          color: LocalKeyColor.BackgroundColor,
          child: Padding(
            padding: EdgeInsets.only(
              top: height * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(
                  height: height * 0.04,
                ),
                Padding(
                  padding:  EdgeInsets.only(left:width * 0.06,right: width * 0.06),
                  child: Container(
                    alignment: Alignment.center,
                    height: height * 0.06,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(0, 4),
                              color: Colors.black38,
                              blurRadius: 4)
                        ]),
                    child:  TextField(
                      controller: searchController,
                      cursorColor: Colors.black,
                      decoration:  InputDecoration(
                        hintText: "Search Product",
                          focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(9.0),
                          child: SizedBox(
                          height: height * 0.2,
                          width: width * 0.02,
                          child: Image.asset(
                            "assets/filterIcon.png",
                            fit: BoxFit.fill,
                          ),
                      ),
                        ),),
                    ),
                  ),
                ),

                SizedBox(
                  height: height * 0.04,
                ),
                Padding(
                  padding:  EdgeInsets.only(left:width * 0.06,right: width * 0.06),
                  child: Text(
                    LocaleKeys.trandingSale,
                    style: TextStyle(
                        fontSize: width * 0.05,
                        fontFamily: "Lalezar",
                        fontWeight: FontWeight.w400),
                  ),
                ),
              SizedBox(height: height * 0.7,
                child: SingleChildScrollView(
                  child: Column(children: [

                    SizedBox(
                      height: height * 0.02,
                    ),
                    Stack(
                      children: [
                        Image.asset(
                          "assets/left2.png",
                          fit: BoxFit.fill,
                        ),
                        Align(alignment: Alignment.bottomRight,
                          child: Padding(
                            padding:  EdgeInsets.only(top: height * 0.240),
                            child: Image.asset(
                              "assets/rghitpan.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top: height * 0.420),
                          child: Image.asset(
                            "assets/left2.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                        Align(alignment: Alignment.bottomRight,
                          child: Padding(
                            padding:  EdgeInsets.only(top: height * 0.580),
                            child: Image.asset(
                              "assets/right2.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),

                        Padding(
                          padding:  EdgeInsets.only(left:width * 0.06,right: width * 0.06),
                          child: SizedBox(
                            height: height * 0.67,
                            width: double.infinity,
                            // child: ListView.builder(
                            //   scrollDirection: Axis.horizontal,
                            //   itemCount: imageList.length,
                            //   itemBuilder: (context, index) {
                            //     return
                            //   },
                            // ),
                            child: GridView.builder(
                             // physics: NeverScrollableScrollPhysics(),
                              itemCount:100,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2,mainAxisSpacing: 1,crossAxisSpacing: 15,childAspectRatio: 0.8), itemBuilder: (context, index) {
                              return GestureDetector(onTap: () {
                                Get.toNamed(Routes.PRODUCT_VIEW);
                              },
                                child: Container(alignment: Alignment.center,
                                  width: width * 0.450,
                                   margin: EdgeInsets.symmetric(vertical: 5),
                                  decoration: BoxDecoration(
                                    //   image: DecorationImage(image: AssetImage(imageList[index])),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow:  [
                                      BoxShadow(
                                          spreadRadius: 0,
                                          // blurStyle: BlurStyle.outer,
                                          offset: Offset(0, 4),
                                          color: Colors.black.withOpacity(0.25),
                                          blurRadius: 4)
                                    ],
                                  ),
                                  child: Text("$index"),
                                ),
                              );
                            },),
                          ),
                        ),

                      ],
                    ),
                    SizedBox(
                      height: height * 0.08,
                    ),
                  ],),
                ),
              )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
