import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sellproducts/routes/app_pages.dart';

class SelectView extends StatefulWidget {
  const SelectView({super.key});

  @override
  State<SelectView> createState() => _SelectViewState();
}

class _SelectViewState extends State<SelectView> {
  int iIsSelected = 0;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: height,
            width: width,
            child: Image.network(
              "https://wallpaperaccess.com/full/2489679.jpg",
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            top: height * 0.68,
            child: Container(
              padding: const EdgeInsets.only(left: 15, right: 15),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              height: height * 0.32,
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      iIsSelected = 1;
                      Map<String, dynamic> map = {
                        'setIndex': iIsSelected,
                      };
                      Get.toNamed(Routes.LOGIN_VIEW, arguments: map);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: height * 0.055,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade700,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Text(
                        "Customer Account",
                        style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 1.5,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.grey.shade400,
                          height: 1,
                          thickness: 2,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 8, right: 8),
                        child: Text("OR"),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.grey.shade400,
                          height: 1,
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      iIsSelected = 2;
                      Map<String, dynamic> map = {
                        'setIndex': iIsSelected,
                      };
                      Get.toNamed(Routes.LOGIN_VIEW, arguments: map);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: height * 0.055,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.blue.shade700, width: 1),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Text(
                        "Business Account",
                        style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 1.5,
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
