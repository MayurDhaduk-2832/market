import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sellproducts/constants/locals.g.dart';
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
          SizedBox(
            height: height,
            width: width,
            child: Image.network(
              "https://wallpaperaccess.com/full/2489679.jpg",
              fit: BoxFit.fill,
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
                      child: Text(
                        LocaleKeys.customer,
                        style: TextStyle(
                            fontSize: height * 0.02,
                            letterSpacing: 1.5,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.025,
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
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Text(
                          LocaleKeys.or,
                          style: TextStyle(fontSize: height * 0.018),
                        ),
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
                  SizedBox(
                    height: height * 0.025,
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
                        LocaleKeys.business,
                        style: TextStyle(
                            fontSize: height * 0.02,
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
