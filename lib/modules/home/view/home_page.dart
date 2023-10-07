// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:like_button/like_button.dart';
import 'package:sellproducts/AllStatic/color.dart';
import 'package:sellproducts/constant/pref_service.dart';
import 'package:sellproducts/constants/locals.g.dart';
import 'package:sellproducts/customs/custom_search_textfield.dart';
import 'package:sellproducts/modules/business/business_controller/business_controller.dart';
import 'package:sellproducts/modules/business/viewmodel/business_insert_viewmodel.dart';
import 'package:sellproducts/modules/home/home_controller/home_controller.dart';
import 'package:sellproducts/modules/home/model/product_data_model.dart';
import 'package:sellproducts/routes/app_pages.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();
  BusinessScreenController businessScreenController = Get.put(BusinessScreenController());
  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  int currentIndex = 0;
  late BusinessCreateViewModel _service;
  List<String> imageList = [
    "assets/shose.jpg",
    "assets/tshirt.jpg",
    "assets/watch.jpg",
  ];

  @override
  void initState() {
    super.initState();

    _service = BusinessCreateViewModel(context);
    getCategoryDate();
    homeScreenController.getDestaricData();
    homeScreenController.getDestaricLongData();
  }

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
          color: LocalKeyColor.BackgroundColor,
          child: Padding(
            padding: EdgeInsets.only(top: height * 0.02),
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.06, right: width * 0.06),
                    child: Row(
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
                              PrefService.getString(LocaleKeys.SPUserName),
                              style: TextStyle(
                                  fontSize: width * 0.05,
                                  fontFamily: "PaytoneOne",
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),

                  /// Search textField
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.06, right: width * 0.06),
                    child: SearchTextFieldCommonWidget(
                        controller: searchController,
                        hintText: "Search Product..."),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  SizedBox(
                    height: height,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CarouselSlider(
                            items: imageList
                                .map(
                                  (e) => Container(
                                    margin: EdgeInsets.only(top: height * 0.05),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        boxShadow: const [
                                          BoxShadow(
                                              offset: Offset(0, 4),
                                              color: Colors.black38,
                                              blurRadius: 4)
                                        ],
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(e))),
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

                    /// Categories
                    Padding(
                      padding:  EdgeInsets.only(left:width * 0.06,right: width * 0.06),
                      child: Text(
                        LocaleKeys.categories,
                        style: TextStyle(
                            fontSize: width * 0.05,
                            fontFamily: "Lalezar",
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left:width * 0.06,right: width * 0.06),
                      child: SizedBox(
                        height: height * 0.175,
                        width: double.infinity,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: businessScreenController.allCategory.value.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Map<String, dynamic> map = {
                                  'saleName':  businessScreenController.allCategory.value[index],
                                };
                                Get.toNamed(Routes.MORE_PRODUCT_VIEW,arguments: map);
                              },
                              child: Container(
                                height: height * 0.100,
                                width: width * 0.275,
                                margin: const EdgeInsets.symmetric(horizontal: 3,vertical: 5),
                                decoration: BoxDecoration(
                                  // image: DecorationImage(fit: BoxFit.fill,image: AssetImage(imageList[index])),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow:  [
                                    BoxShadow(
                                        spreadRadius: 0,
                                        // blurStyle: BlurStyle.outer,
                                        offset: const Offset(0, 4),
                                        color: Colors.black.withOpacity(0.25),
                                        blurRadius: 4)
                                  ],
                                ),
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                                  Expanded(flex: 5,
                                    child: Container(height: height * 0.1,margin: EdgeInsets.all(5),decoration: BoxDecoration(
                                      image: DecorationImage(fit: BoxFit.fill,image: NetworkImage("https://mdprojects1203.000webhostapp.com/${businessScreenController.CategoryImage[index]}")),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    ),
                                  ),
                                  Expanded(flex: 2,child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text("${ businessScreenController.allCategory.value[index]}",
                                      style: TextStyle(fontSize: width * 0.03 ,fontWeight: FontWeight.w900),),
                                  )),
                                ]),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    /// trading sale image list
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                        Padding(
                          padding:  EdgeInsets.only(right: width * 0.06),
                          child: IconButton(
                            onPressed: () {
                              Map<String, dynamic> map = {
                                'saleName': LocaleKeys.trandingSale,
                              };
                              Get.toNamed(Routes.MORE_PRODUCT_VIEW,arguments: map);
                            },
                            icon: Icon(
                              Icons.more_horiz_rounded,
                              color: Colors.black,
                              size: width * 0.07,
                            ),
                          ),
                        )
                      ],
                    ),

                    (homeScreenController.productDataModel.data !=[])?
                    Center(child: Image.asset( "assets/coupenOffer.png",height: height * 0.08,)):SizedBox(),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    (homeScreenController.productDataModel.data !=[])? Padding(
                      padding:  EdgeInsets.only(left:width * 0.06,right: width * 0.06),
                      child: SizedBox(
                        height: height * 0.175,
                        width: double.infinity,
                        child: ListView.builder(physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: homeScreenController.productDataModel.data?.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Map<String, dynamic> map = {
                                  'saleProductName': homeScreenController.productDataModel.data?[index],
                                  'saleProductImage': imageList[index],
                                };
                                Get.toNamed(Routes.PRODUCT_VIEW,arguments: map);
                              },
                              child: Container(
                                height: height * 0.100,
                                width: width * 0.275,
                                margin: const EdgeInsets.symmetric(horizontal: 3,vertical: 5),
                                decoration: BoxDecoration(
                                 // image: DecorationImage(fit: BoxFit.fill,image: AssetImage(imageList[index])),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow:  [
                                    BoxShadow(
                                        spreadRadius: 0,
                                        // blurStyle: BlurStyle.outer,
                                        offset: const Offset(0, 4),
                                        color: Colors.black.withOpacity(0.25),
                                        blurRadius: 4)
                                  ],
                                ),
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                                  Expanded(flex: 5,
                                    child: Container(height: height * 0.1,margin: EdgeInsets.all(5),decoration: BoxDecoration(
                                        image: DecorationImage(fit: BoxFit.fill,image: AssetImage(imageList[index])),
                                        borderRadius: BorderRadius.circular(10),
                                    ),
                                    ),
                                  ),
                                  Expanded(child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text("${homeScreenController.productDataModel.data?[index].productName}",
                                      style: TextStyle(fontSize: height * 0.015,fontWeight: FontWeight.w900),),
                                  )),
                                  Expanded(child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text("Offer-${homeScreenController.productDataModel.data?[index].salePrice}",
                                      style: TextStyle(fontSize: height * 0.015,color: Colors.grey),),
                                  )),
                                ]),
                              ),
                            );
                          },
                        ),
                      ),
                    ):Center(child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text("No Trending sale", style: TextStyle(fontSize: height * 0.018,color: Colors.black)),
                    )),
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
                    SizedBox(
                      height: height * 0.02,
                    ),
                    (homeScreenController.productData !=[])? Padding(
                      padding: EdgeInsets.only(left:width * 0.06,right: width * 0.06),
                      child: SizedBox(
                        height: width * 1.1,
                        width: double.infinity,
                        child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: homeScreenController.productData.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2,mainAxisSpacing: 15,crossAxisSpacing: 5,childAspectRatio: 0.9),
                          itemBuilder: (context, index) {
                          return GestureDetector(onTap: () {
                            Map<String, dynamic> map = {
                              'saleProductName': homeScreenController.productData[index],
                              'saleProductImage': imageList[index],
                            };
                            Get.toNamed(Routes.PRODUCT_VIEW,arguments: map);
                          },
                            child: Container(
                              width: width * 0.275,
                              margin: const EdgeInsets.symmetric(horizontal: 3,vertical: 5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow:  [
                                  BoxShadow(
                                      spreadRadius: 0,
                                      // blurStyle: BlurStyle.outer,
                                      offset: const Offset(0, 4),
                                      color: Colors.black.withOpacity(0.25),
                                      blurRadius: 4)
                                ],
                              ),
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                                Expanded(flex: 6,
                                  child: Container(height: height * 0.1,margin: EdgeInsets.all(5),decoration: BoxDecoration(
                                    image: DecorationImage(fit: BoxFit.fill,image: AssetImage(imageList[index])),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  ),
                                ),
                                Expanded(child: Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text("${homeScreenController.productData[index].productName}",style: TextStyle(fontSize: height * 0.02,fontWeight: FontWeight.w900),),
                                )),

                                Expanded(flex: 2,
                                  child: Row(
                                    children: [
                                      Expanded(flex: 2,child: Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Text("Offer:${homeScreenController.productData[index].salePrice}",style: TextStyle(fontSize: height * 0.02,color: Colors.grey),),
                                      )),
                                      Expanded(child: Padding(
                                        padding: const EdgeInsets.only(bottom: 5),
                                      child: LikeButton(isLiked: homeScreenController.isLike.value[index],size: width * 0.06,likeBuilder: (isLiked) {
                                        homeScreenController.isLike.value[index]=isLiked;
                                        return (isLiked)?Icon(CupertinoIcons.heart_fill,color: Color(0xffE96E6E),size: width * 0.06)
                                            :Icon(CupertinoIcons.heart,size: width * 0.06,);
                                      },),

                                      )),
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          );
                        },),
                      ),
                    ):Center(child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text("No Trending sale", style: TextStyle(fontSize: height * 0.018,color: Colors.black)),
                    )),

                    /// regular sale
                    // trading sale image list
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(left:width * 0.06,right: width * 0.06),
                          child: Text(
                            LocaleKeys.RegularSale,
                            style: TextStyle(
                                fontSize: width * 0.05,
                                fontFamily: "Lalezar",
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(right: width * 0.06),
                          child: IconButton(
                            onPressed: () {
                              Map<String, dynamic> map = {
                                'saleName': LocaleKeys.RegularSale,
                              };
                              Get.toNamed(Routes.MORE_PRODUCT_VIEW,arguments: map);
                            },
                            icon: Icon(
                              Icons.more_horiz_rounded,
                              color: Colors.black,
                              size: width * 0.07,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    (homeScreenController.productLongDataModel.data !=[])? Padding(
                      padding:  EdgeInsets.only(left:width * 0.06,right: width * 0.06),
                      child: SizedBox(
                        height: height * 0.175,
                        width: double.infinity,
                        child: ListView.builder(physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: homeScreenController.productLongDataModel.data?.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Map<String, dynamic> map = {
                                  'saleProductName': homeScreenController.productLongDataModel.data?[index],
                                  'saleProductImage': imageList[index],
                                };
                                Get.toNamed(Routes.PRODUCT_VIEW,arguments: map);
                              },
                              child: Container(
                                height: height * 0.100,
                                width: width * 0.275,
                                margin: const EdgeInsets.symmetric(horizontal: 3,vertical: 5),
                                decoration: BoxDecoration(
                                  // image: DecorationImage(fit: BoxFit.fill,image: AssetImage(imageList[index])),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow:  [
                                    BoxShadow(
                                        spreadRadius: 0,
                                        // blurStyle: BlurStyle.outer,
                                        offset: const Offset(0, 4),
                                        color: Colors.black.withOpacity(0.25),
                                        blurRadius: 4)
                                  ],
                                ),
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                                  Expanded(flex: 5,
                                    child: Container(height: height * 0.1,margin: EdgeInsets.all(5),decoration: BoxDecoration(
                                      image: DecorationImage(fit: BoxFit.fill,image: AssetImage(imageList[index])),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    ),
                                  ),
                                  Expanded(child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text("${homeScreenController.productLongDataModel.data?[index].productName}",
                                      style: TextStyle(fontSize: height * 0.015,fontWeight: FontWeight.w900),),
                                  )),
                                  Expanded(child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text("Offer-${homeScreenController.productLongDataModel.data?[index].salePrice}",
                                      style: TextStyle(fontSize: height * 0.015,color: Colors.grey),),
                                  )),
                                ]),
                              ),
                            );
                          },
                        ),
                      ),
                    ):Center(child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text("No Trending sale", style: TextStyle(fontSize: height * 0.018,color: Colors.black)),
                    )),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    Padding(
                      padding:  EdgeInsets.only(left:width * 0.06,right: width * 0.06),
                      child: Text(
                        LocaleKeys.RegularSale,
                        style: TextStyle(
                            fontSize: width * 0.05,
                            fontFamily: "Lalezar",
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    (homeScreenController.productLongData !=[])? Padding(
                      padding: EdgeInsets.only(left:width * 0.06,right: width * 0.06),
                      child: SizedBox(
                       height: height,
                       //  width: double.infinity,
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: homeScreenController.productLongData.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2,mainAxisSpacing: 15,crossAxisSpacing: 5,childAspectRatio: 0.9),
                          itemBuilder: (context, index) {
                            return GestureDetector(onTap: () {
                              Map<String, dynamic> map = {
                                'saleProductName': homeScreenController.productLongData[index],
                                'saleProductImage': imageList[index],
                              };
                              Get.toNamed(Routes.PRODUCT_VIEW,arguments: map);
                            },
                              child: Container(
                                width: width * 0.275,
                                margin: const EdgeInsets.symmetric(horizontal: 3,vertical: 5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow:  [
                                    BoxShadow(
                                        spreadRadius: 0,
                                        // blurStyle: BlurStyle.outer,
                                        offset: const Offset(0, 4),
                                        color: Colors.black.withOpacity(0.25),
                                        blurRadius: 4)
                                  ],
                                ),
                                child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                                  Expanded(flex: 6,
                                    child: Container(height: height * 0.1,margin: EdgeInsets.all(5),decoration: BoxDecoration(
                                      image: DecorationImage(fit: BoxFit.fill,image: AssetImage(imageList[index])),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    ),
                                  ),
                                  Expanded(child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text("${homeScreenController.productLongData[index].productName}",style: TextStyle(fontSize: height * 0.02,fontWeight: FontWeight.w900),),
                                  )),

                                  Expanded(flex: 2,
                                    child: Row(
                                      children: [
                                        Expanded(flex: 2,child: Padding(
                                          padding: const EdgeInsets.only(left: 5),
                                          child: Text("Offer:${homeScreenController.productLongData[index].salePrice}",style: TextStyle(fontSize: height * 0.02,color: Colors.grey),),
                                        )),
                                        Expanded(child: Padding(
                                          padding: const EdgeInsets.only(bottom: 5),
                                          child: LikeButton(isLiked: homeScreenController.isLike.value[index],size: width * 0.06,likeBuilder: (isLiked) {
                                            homeScreenController.isLike.value[index]=isLiked;
                                            return (isLiked)?Icon(CupertinoIcons.heart_fill,color: Color(0xffE96E6E),size: width * 0.06)
                                                :Icon(CupertinoIcons.heart,size: width * 0.06,);
                                          },),

                                        )),
                                      ],
                                    ),
                                  )
                                ]),
                              ),
                            );
                          },),
                      ),
                    ):Center(child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text("No Trending sale", style: TextStyle(fontSize: height * 0.018,color: Colors.black)),
                    )),
                    SizedBox(
                      height: height * 0.1,
                    ),
                  ],),
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
  getCategoryDate()
  async {
    final response = await _service.getCategory();
    response?.categories?.forEach((element) {
      businessScreenController.allCategory.value.add(element.category ?? "");
      businessScreenController.CategoryImage.value.add(element.categoryImage ?? "");
    });
  }
}
