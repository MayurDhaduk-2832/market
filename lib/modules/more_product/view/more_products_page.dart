// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sellproducts/customs/custom_search_textfield.dart';
import 'package:sellproducts/routes/app_pages.dart';

class MoreProductsScreen extends StatefulWidget {
  const MoreProductsScreen({super.key});

  @override
  State<MoreProductsScreen> createState() => _MoreProductsScreenState();
}

class _MoreProductsScreenState extends State<MoreProductsScreen> {
  final searchController = TextEditingController();
  int currentIndex = 0;
  String saleName = "";
  dynamic argumentData = Get.arguments;
  List<String> imageList = [
    "assets/shose.jpg",
    "assets/tshirt.jpg",
    "assets/watch.jpg",
    "assets/car.jpg"
  ];
  List<bool> isLike = [];

  @override
  void initState() {
    super.initState();
    // _service = BusinessCreateViewModel(context);
    if (argumentData != null && argumentData is Map<String, dynamic>) {
      saleName = argumentData['saleName'];
    }
    isLike = List.generate(imageList.length, (index) => false);
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
          color: Colors.brown.shade50,
          child: Padding(
            padding: EdgeInsets.only(top: height * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.04,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.06, right: width * 0.06),
                  child: SearchTextFieldCommonWidget(
                      controller: searchController,
                      hintText: "Search Product..."),
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
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.06, right: width * 0.06),
                    child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: imageList.length,
                      // shrinkWrap: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      addAutomaticKeepAlives: true,

                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              mainAxisSpacing: 1,
                              crossAxisSpacing: 15,
                              childAspectRatio: 1.5),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Map<String, dynamic> map = {
                              'saleProductName': "Abc",
                              'saleProductImage': imageList[index],
                            };
                            Get.toNamed(Routes.PRODUCT_VIEW, arguments: map);
                          },
                          child: Container(
                            width: width * 0.275,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 3, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 0,
                                    // blurStyle: BlurStyle.outer,
                                    offset: const Offset(0, 4),
                                    color: Colors.black.withOpacity(0.25),
                                    blurRadius: 4)
                              ],
                            ),
                            child: Row(children: [
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        height: height * 0.22,
                                        margin: EdgeInsets.symmetric(horizontal: width * 0.03),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image:
                                                  AssetImage(imageList[index])),
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                Container(color: Colors.black,width: 1,margin: EdgeInsets.symmetric(vertical: height * 0.03)),
                                Expanded(flex: 2,
                                          child: Padding(
                                        padding:
                                             EdgeInsets.only(left: 5, top: height * 0.03),
                                        child:Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                                          Expanded(
                                            child: Text(
                                              "Brand name :-",
                                              style: TextStyle(
                                                  fontSize: height * 0.015,
                                                  fontWeight: FontWeight.w900),
                                            ),
                                          ),
                                          Divider(),
                                          Expanded(
                                            child: Text(
                                              "Product name :-",
                                              style: TextStyle(
                                                  fontSize: height * 0.015,
                                                  fontWeight: FontWeight.w900),
                                            ),
                                          ),
                                          Divider(),
                                          Expanded(
                                            child: Text(
                                              "Address :-",
                                              style: TextStyle(
                                                  fontSize: height * 0.015,
                                                  fontWeight: FontWeight.w900),
                                            ),
                                          ),
                                          Divider(),
                                          Expanded(
                                            child: Text(
                                              "Sale Prise :-",
                                              style: TextStyle(
                                                  fontSize: height * 0.015,
                                                  fontWeight: FontWeight.w900),
                                            ),
                                          ),
                                        ],)
                                      )),
                            ]),
                            // child: Column(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: [
                            //       Expanded(
                            //         flex: 6,
                            //         child: Container(
                            //           height: height * 0.1,
                            //           margin: EdgeInsets.all(5),
                            //           decoration: BoxDecoration(
                            //             image: DecorationImage(
                            //                 fit: BoxFit.fill,
                            //                 image:
                            //                     AssetImage(imageList[index])),
                            //             borderRadius: BorderRadius.circular(10),
                            //           ),
                            //         ),
                            //       ),
                            //       Expanded(
                            //           child: Padding(
                            //         padding:
                            //             const EdgeInsets.only(left: 5, top: 4),
                            //         child: Text(
                            //           "Abc",
                            //           style: TextStyle(
                            //               fontSize: height * 0.02,
                            //               fontWeight: FontWeight.w900),
                            //         ),
                            //       )),
                            //       Expanded(
                            //           flex: 2,
                            //           child: Row(
                            //             children: [
                            //               Expanded(
                            //                 flex: 3,
                            //                 child: Padding(
                            //                   padding: const EdgeInsets.only(
                            //                       left: 5),
                            //                   child: Text(
                            //                     "%2",
                            //                     style: TextStyle(
                            //                         fontSize: height * 0.02,
                            //                         color: Colors.grey),
                            //                   ),
                            //                 ),
                            //               ),
                            //               Expanded(
                            //                   child: Padding(
                            //                 padding: const EdgeInsets.only(
                            //                     bottom: 5),
                            //                 child: IconButton(
                            //                     onPressed: () {
                            //                       setState(() {
                            //                         if (isLike[index] ==
                            //                             false) {
                            //                           isLike[index] = true;
                            //                         } else {
                            //                           isLike[index] = false;
                            //                         }
                            //                       });
                            //                     },
                            //                     icon: (isLike[index] == true)
                            //                         ? Icon(
                            //                             CupertinoIcons
                            //                                 .heart_fill,
                            //                             color:
                            //                                 Color(0xffE96E6E),
                            //                             size: width * 0.06)
                            //                         : Icon(
                            //                             CupertinoIcons.heart,
                            //                             size: width * 0.06,
                            //                           )),
                            //               ))
                            //             ],
                            //           )),
                            //     ]),
                          ),
                        );
                      },
                    ),
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
