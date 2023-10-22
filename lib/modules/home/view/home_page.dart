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
import 'package:sellproducts/modules/home/home_controller.dart';
import 'package:sellproducts/modules/home/home_controller/home_controller.dart';
import 'package:sellproducts/modules/home/model/product_data_model.dart';
import 'package:sellproducts/modules/search_product/searchProducts_controller/search_products_controller.dart';
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
  HomeController homeController = Get.put(HomeController());
  SearchProductsScreenController searchProductsScreenController = Get.put(SearchProductsScreenController());
  int currentIndex = 0;
  late BusinessCreateViewModel _service;
  List<String> imageList = [
    "assets/shose.jpg",
    "assets/tshirt.jpg",
    "assets/watch.jpg",
  ];

  // @override
  // void initState() {
  //   super.initState();
  //
  //   _service = BusinessCreateViewModel(context);
  //   getCategoryDate();
  //   homeScreenController.getDestaricData();
  //   homeScreenController.getDestaricLongData();
  // }

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
                    child: SearchTextFieldCommonWidget(onTap: () {
                      searchProductsScreenController.searchController.value.text = "";
                      Get.toNamed(Routes.SEARCH_PRODUCTS_VIEW);
                      searchProductsScreenController.update(['searchProduct']);
                    },readOnly: true,hintText: "Search Product..."),
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
                                    margin: EdgeInsets.only(top: height * 0.05,left: 5,right: 5),
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
                              scrollPhysics: BouncingScrollPhysics(),
                              animateToClosest: true,
                              height: height * 0.260,
                              autoPlay: true,
                          //    autoPlayAnimationDuration: Duration(seconds: 10),
                              enlargeCenterPage: false,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  currentIndex = index;
                                });
                              },
                              autoPlayInterval:  Duration(seconds:5),
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
                                    border: Border.all(),
                                      shape: BoxShape.circle,
                                      color: currentIndex == index
                                          ? Colors.white
                                          : Colors.black12),
                                );
                              }).toList()),

                    /// Categories
                    Padding(
                      padding:  EdgeInsets.only(left:width * 0.06,right: width * 0.06),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            LocaleKeys.categories,
                            style: TextStyle(
                                fontSize: width * 0.05,
                                fontFamily: "Lalezar",
                                fontWeight: FontWeight.w400),
                          ),
                          GestureDetector(onTap: () {
                            Get.toNamed(Routes.CATEGORY_VIEW);
                          },
                            child: Icon(
                              Icons.more_horiz_rounded,
                              color: Colors.black,
                              size: width * 0.07,
                            ),
                          ),

                        ],
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
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: homeScreenController.categoryModel.categories?.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Map<String, dynamic> map = {
                                  // 'saleName':  "Category",
                                  'saleName':  homeScreenController.categoryModel.categories?[index],
                                  'Caterory': false,
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
                                      image: DecorationImage(fit: BoxFit.fill,image: NetworkImage("https://mdprojects1203.000webhostapp.com/${ homeScreenController.categoryModel.categories?[index].categoryImage ?? ""}")),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    ),
                                  ),
                                  Expanded(flex: 2,child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(homeScreenController.categoryModel.categories?[index].category ?? "",
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
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(left:width * 0.06,right: width * 0.06),
                          child: Text(
                            LocaleKeys.trandingSale.tr,
                            style: TextStyle(
                                fontSize: width * 0.05,
                                fontFamily: "Lalezar",
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(right: width * 0.06),
                          child: GestureDetector(onTap: () {
                               Map<String, dynamic> map = {
                                 'saleName': LocaleKeys.trandingSale,
                                 'Caterory': false,
                               };
                               Get.toNamed(Routes.MORE_PRODUCT_VIEW,arguments: map);
                             },
                               child: Icon(
                                Icons.more_horiz_rounded,
                                color: Colors.black,
                                size: width * 0.07,
                            ),
                             ),

                        )
                      ],
                    ),

                   Obx(
                       ()=> Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                       (homeController.inRangeProducts.value.data !=[])?
                       Center(child: Image.asset( "assets/coupenOffer.png",height: height * 0.08,)):SizedBox(),
                       SizedBox(
                         height: height * 0.01,
                       ),
                       (homeController.inRangeProducts.value.data !=[])? Padding(
                         padding:  EdgeInsets.only(left:width * 0.06,right: width * 0.06),
                         child: SizedBox(
                           height: height * 0.175,
                           width: double.infinity,
                           child: ListView.builder(physics: NeverScrollableScrollPhysics(),
                             scrollDirection: Axis.horizontal,
                             itemCount: homeController.inRangeProducts.value.data?.length,
                             itemBuilder: (context, index) {
                               return GestureDetector(
                                 onTap: () {
                                   Map<String, dynamic> map = {
                                     'saleProductName': homeController.inRangeProducts.value.data?[index],
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
                                         image: DecorationImage(fit: BoxFit.fill,image: AssetImage("assets/shose.jpg")),
                                         borderRadius: BorderRadius.circular(10),
                                       ),
                                       ),
                                     ),
                                     Expanded(child: Padding(
                                       padding: const EdgeInsets.only(left: 5),
                                       child: Text("${homeController.inRangeProducts.value.data?[index].productName}",
                                         style: TextStyle(fontSize: height * 0.015,fontWeight: FontWeight.w900),),
                                     )),
                                     Expanded(child: Padding(
                                       padding: const EdgeInsets.only(left: 5),
                                       child: Text("Offer-${homeController.inRangeProducts.value.data?[index].salePrice}",
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
                       (homeController.inRangeProducts.value.data !=[])? Padding(
                         padding: EdgeInsets.only(left:width * 0.06,right: width * 0.06),
                         child: SizedBox(
                           height: width * 1.1,
                           width: double.infinity,
                           child: GridView.builder(
                             physics: NeverScrollableScrollPhysics(),
                             itemCount: homeController.inRangeProducts.value.data?.length,
                             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2,mainAxisSpacing: 15,crossAxisSpacing: 5,childAspectRatio: 0.9),
                             itemBuilder: (context, index) {
                               return GestureDetector(onTap: () {
                                 Map<String, dynamic> map = {
                                   'saleProductName': homeController.inRangeProducts.value.data?[index],
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
                                         image: DecorationImage(fit: BoxFit.fill,image: AssetImage("assets/shose.jpg")),
                                         borderRadius: BorderRadius.circular(10),
                                       ),
                                       ),
                                     ),
                                     Expanded(child: Padding(
                                       padding: const EdgeInsets.only(left: 5),
                                       child: Text("${homeController.inRangeProducts.value.data?[index].productName}",style: TextStyle(fontSize: height * 0.02,fontWeight: FontWeight.w900),),
                                     )),

                                     Expanded(flex: 2,
                                       child: Row(
                                         children: [
                                           Expanded(flex: 2,child: Padding(
                                             padding: const EdgeInsets.only(left: 5),
                                             child: Text("Offer:${homeController.inRangeProducts.value.data?[index].salePrice}",style: TextStyle(fontSize: height * 0.02,color: Colors.grey),),
                                           )),
                                           Expanded(child: Padding(
                                             padding: const EdgeInsets.only(bottom: 5),
                                           child: LikeButton(isLiked: homeController.isLike.value[index],size: width * 0.06,likeBuilder: (isLiked) {
                                             homeController.isLike.value[index]=isLiked;
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

                     ],),
                   ),
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
                          child: GestureDetector(onTap: () {
                            Map<String, dynamic> map = {
                              'saleName': LocaleKeys.RegularSale.tr,
                              'Caterory': false,
                            };
                            Get.toNamed(Routes.MORE_PRODUCT_VIEW,arguments: map);
                          },
                            child: Icon(
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
                      Obx(
                          ()=> Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                          (homeController.outRangeProducts.value.data !=[])? Padding(
                            padding:  EdgeInsets.only(left:width * 0.06,right: width * 0.06),
                            child: SizedBox(
                              height: height * 0.175,
                              width: double.infinity,
                              child: ListView.builder(physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: homeController.outRangeProducts.value.data?.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Map<String, dynamic> map = {
                                        'saleProductName': homeController.outRangeProducts.value.data?[index],
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
                                            image: DecorationImage(fit: BoxFit.fill,image: AssetImage("assets/shose.jpg")),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          ),
                                        ),
                                        Expanded(child: Padding(
                                          padding: const EdgeInsets.only(left: 5),
                                          child: Text("${homeController.outRangeProducts.value.data?[index].productName}",
                                            style: TextStyle(fontSize: height * 0.015,fontWeight: FontWeight.w900),),
                                        )),
                                        Expanded(child: Padding(
                                          padding: const EdgeInsets.only(left: 5),
                                          child: Text("Offer-${homeController.outRangeProducts.value.data?[index].salePrice}",
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
                          (homeController.outRangeProducts.value.data !=[])? Padding(
                            padding: EdgeInsets.only(left:width * 0.06,right: width * 0.06),
                            child: SizedBox(
                              height: height,
                              //  width: double.infinity,
                              child: GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: homeController.outRangeProducts.value.data?.length,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2,mainAxisSpacing: 15,crossAxisSpacing: 5,childAspectRatio: 0.9),
                                itemBuilder: (context, index) {
                                  return GestureDetector(onTap: () {
                                    Map<String, dynamic> map = {
                                      'saleProductName': homeController.outRangeProducts.value.data?[index],
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
                                            image: DecorationImage(fit: BoxFit.fill,image: AssetImage("assets/shose.jpg")),
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          ),
                                        ),
                                        Expanded(child: Padding(
                                          padding: const EdgeInsets.only(left: 5),
                                          child: Text("${homeController.outRangeProducts.value.data?[index].productName}",style: TextStyle(fontSize: height * 0.02,fontWeight: FontWeight.w900),),
                                        )),

                                        Expanded(flex: 2,
                                          child: Row(
                                            children: [
                                              Expanded(flex: 2,child: Padding(
                                                padding: const EdgeInsets.only(left: 5),
                                                child: Text("Offer:${homeController.outRangeProducts.value.data?[index].salePrice}",style: TextStyle(fontSize: height * 0.02,color: Colors.grey),),
                                              )),
                                              Expanded(child: Padding(
                                                padding: const EdgeInsets.only(bottom: 5),
                                                child: LikeButton(isLiked: homeController.isLike.value[index],size: width * 0.06,likeBuilder: (isLiked) {
                                                  homeController.isLike.value[index]=isLiked;
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
                        ],),
                      ),
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
}
