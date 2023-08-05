import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sellproducts/AllStatic/color.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: LocalKeyColor.BackgroundColor,
      body: Container(
        height: height,
        width: width,
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:  EdgeInsets.only(left:width * 0.06,right: width * 0.06),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        height: height * 0.05,
                        width: height * 0.05,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 2)
                            ]),
                        child: const Icon(Icons.arrow_back),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: height * 0.05,
                        width: height * 0.05,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 0,
                                  offset: Offset(0, 4),
                                  color: Colors.black.withOpacity(0.25),
                                  blurRadius: 4)
                            ],
                            borderRadius: BorderRadius.circular(30)),
                        child: const Icon(Icons.share),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.04,),
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
                    padding:  EdgeInsets.only(top: height * 0.510),
                    child: Image.asset(
                      "assets/left2.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Align(alignment: Alignment.bottomRight,
                    child: Padding(
                      padding:  EdgeInsets.only(top: height * 0.730),
                      child: Image.asset(
                        "assets/right2.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
              Container(alignment: Alignment.center,height: height * 0.5,margin: EdgeInsets.all(25),
           //   padding: EdgeInsets.all(20),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white,
                boxShadow:  [
                  BoxShadow(
                      spreadRadius: 0,
                      // blurStyle: BlurStyle.outer,
                      offset: Offset(0, 4),
                      color: Colors.black.withOpacity(0.25),
                      blurRadius: 4)
                ],
              ),
                child: SizedBox(height: height * 0.44,width: width * 0.8,child: Image.asset(fit: BoxFit.fill,"assets/producView.png")),
              )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
