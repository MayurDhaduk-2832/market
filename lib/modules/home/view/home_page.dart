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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                left: width * 0.06, top: height * 0.02, right: width * 0.06),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleKeys.welcome,
                            style: TextStyle(
                                fontSize: width * 0.05,
                                fontFamily: "koho",
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "Dhruv Savaliya",
                            style: TextStyle(
                                fontSize: width * 0.05,
                                fontFamily: "PaytoneOne",
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: width * 0.03),
                        child: SizedBox(
                          height: height * 0.07,
                          width: width * 0.140,
                          child: Image.asset(
                            "assets/loginphoto.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Container(
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
                      decoration: const InputDecoration(
                        hintText: "Search Product",
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          suffixIcon: Icon(
                            Icons.filter_list_rounded,
                            color: Colors.black,
                          )),
                    ),
                  ),
                Stack(children: [
                  SizedBox(
                    child: Image.asset(
                      "assets/leftpan.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  CarouselSlider(
                    items: imageList
                        .map(
                          (e) => Container(margin: EdgeInsets.only(top: height * 0.05),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [
                              BoxShadow(
                                  offset: Offset(0, 4),
                                  color: Colors.black38,
                                  blurRadius: 4)
                            ],
                            image: DecorationImage(
                                fit: BoxFit.fill, image: AssetImage(e))),
                      ),
                    )
                        .toList(),
                    options: CarouselOptions(
                      animateToClosest: true,
                      height: height * 0.250,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex = index;
                        });
                      },
                      autoPlayInterval: const Duration(seconds: 2),
                    ),
                  ),
                ],),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imageList.map((e) {
                        int index = imageList.indexOf(e);
                        return Container(
                          width: 8,
                          height: 8,
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 3),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: currentIndex == index
                                  ? Colors.white
                                  : Colors.black12),
                        );
                      }).toList()),
                  // trading sale image list
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LocaleKeys.trandingSale,
                        style: TextStyle(
                            fontSize: width * 0.05,
                            fontFamily: "Lalezar",
                            fontWeight: FontWeight.w400),
                      ),
                      Stack(
                        children: [
                          SizedBox(
                            child: Image.asset(
                              "assets/rghitpan.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.more_horiz_rounded,
                              color: Colors.black,
                              size: width * 0.07,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  SizedBox(
                    height: height * 0.160,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: imageList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.PRODUCT_VIEW);
                          },
                          child: Container(
                            width: width * 0.350,
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage(imageList[index])),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  blurStyle: BlurStyle.outer,
                                    offset: Offset(0, 4),
                                    color: Colors.black38,
                                    blurRadius: 4)
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  Text(
                    LocaleKeys.trandingSale,
                    style: TextStyle(
                        fontSize: width * 0.05,
                        fontFamily: "Lalezar",
                        fontWeight: FontWeight.w400),
                  ),
                  Stack(
                    children: [
                      SizedBox(
                        child: Image.asset(
                          "assets/left2.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                      Align(alignment: Alignment.bottomRight,
                        child: Padding(
                          padding:  EdgeInsets.only(top: height * 0.280),
                          child: SizedBox(
                            child: Image.asset(
                              "assets/right2.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.320,
                        width: double.infinity,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: imageList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(onTap: () {
                              Get.toNamed(Routes.PRODUCT_VIEW);
                            },
                              child: Container(
                                width: width * 0.450,
                                margin: EdgeInsets.symmetric(horizontal: 5,vertical: 20),
                                decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage(imageList[index])),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                        blurStyle: BlurStyle.outer,
                                        offset: Offset(0, 4),
                                        color: Colors.black38,
                                        blurRadius: 4)
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: height * 0.08,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
