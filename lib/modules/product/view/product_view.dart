import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final height = Get.height;
  final width = Get.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * 0.6,
              width: width,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: height * 0.6,
                    width: width,
                    child: Image.asset(
                      "assets/asset1.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    height: height * 0.1,
                    width: width,
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
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
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 2)
                                ],
                                borderRadius: BorderRadius.circular(30)),
                            child: const Icon(Icons.share),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: -(height * 0.025),
                    right: 20,
                    child: Container(
                      height: height * 0.05,
                      width: height * 0.05,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 2)
                          ]),
                      child: const Icon(CupertinoIcons.heart),
                    ),
                  ),
                ],
              ),
            ),
            Text("Product name"),
            Text("price"),
          ],
        ),
      ),
    );
  }
}
