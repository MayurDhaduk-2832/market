import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sellproducts/constant/LocalColors.dart';

import 'package:sellproducts/constants/locals.g.dart';
import 'package:sellproducts/routes/app_pages.dart';

class LanguageView extends StatefulWidget {
  const LanguageView({super.key});

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  int isSelectedLanguage = 0;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              height: height,
              width: width,
              child: Image.asset(
                "assets/asset1.png",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: height * 0.055,
              left: height * 0.025,
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: height * 0.05,
                  width: height * 0.05,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Icon(Icons.arrow_back),
                ),
              ),
            ),
            Positioned(
              top: height * 0.55,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                height: height * 0.53,

                width: width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.025,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: width * 0.04),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          LocaleKeys.skip,
                          style: TextStyle(
                              fontSize: height * 0.02,
                              color: const Color(0xFF8D8D8D)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                     Text(
                      LocaleKeys.selectLanguage,
                      style: TextStyle(
                           fontSize: height * 0.02,
                          fontWeight: FontWeight.w900,
                        //  color: const Color(0xFF8D8D8D),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: width * 0.020,
                        ),
                        GestureDetector(onTap: () {
                          isSelectedLanguage = 1;
                          setState(() {

                          });
                        },
                          child: Container(
                            alignment: Alignment.center,
                            height: height * 0.05,
                            width: width * 0.4,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: (isSelectedLanguage==1)?button1Color:Colors.grey.shade500, width: 2),
                                borderRadius: BorderRadius.circular(10)),
                            child:  Text(
                              LocaleKeys.english,
                              style: TextStyle(
                                  fontSize: height * 0.02,
                                  color:  (isSelectedLanguage==1)?button1Color:Color(0xFF8D8D8D),
                                  fontWeight: FontWeight.w200),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.049,
                        ),
                        GestureDetector(onTap: () {
                          isSelectedLanguage = 2;
                          setState(() {

                          });
                        },
                          child: Container(
                            alignment: Alignment.center,
                            height: height * 0.05,

                            width: width * 0.4,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: (isSelectedLanguage==2)?button1Color:Colors.grey.shade500, width: 2),
                                borderRadius: BorderRadius.circular(10)),
                            child:  Text(
                              LocaleKeys.gujarati,
                              style: TextStyle(
                                  fontSize: height * 0.02,
                                  color:  (isSelectedLanguage==2)?button1Color:Color(0xFF8D8D8D),
                                  fontWeight: FontWeight.w200),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(onTap: () {
                        isSelectedLanguage = 3;
                        setState(() {

                        });
                      },
                        child: Container(
                          margin: EdgeInsets.only(left: width * 0.02),
                          alignment: Alignment.center,
                          height: height * 0.05,
                          width: width * 0.4,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: (isSelectedLanguage==3)?button1Color:Colors.grey.shade500, width: 2),
                              borderRadius: BorderRadius.circular(10)),
                          child:  Text(
                            LocaleKeys.hindi,
                            style: TextStyle(
                              fontSize: height * 0.02,
                                color:  (isSelectedLanguage==3)?button1Color:Color(0xFF8D8D8D),
                                fontWeight: FontWeight.w200),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.060,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.PRODUCT_VIEW);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: height * 0.055,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                                color: Colors.grey.shade500, width: 1.5)),
                        child: Text(
                          LocaleKeys.Continue,
                          style: TextStyle(
                            color: const Color(0xFF8D8D8D),
                            fontSize: height * 0.02,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
