// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sellproducts/AllStatic/color.dart';
import 'package:sellproducts/constants/locals.g.dart';
import 'package:sellproducts/modules/business/viewmodel/business_insert_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final businessNameController = TextEditingController();
  int currontIndex = 0;
  late BusinessCreateViewModel _service;
  List<String> imageList=["assets/shose.jpg","assets/tshirt.jpg","assets/watch.jpg","assets/car.jpg"];

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
                  Container(alignment: Alignment.center,
                    height: height * 0.05,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(0, 4),
                              color: Colors.black38,
                              blurRadius: 4)
                        ]),
                    child: const TextField(
                      cursorColor: Colors.black,
                      decoration: InputDecoration(contentPadding: EdgeInsets.only(top: 7),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        suffixIcon:Icon(Icons.filter_list_rounded,color: Colors.black,)
                    ),
                  ),),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  // slider
                  CarouselSlider(
                      items:imageList.map((e) =>  Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                            boxShadow: const [BoxShadow(
                                offset: Offset(0, 4),
                                color: Colors.black38,
                                blurRadius: 4)], image: DecorationImage(fit: BoxFit.fill,image: AssetImage(e))),),).toList(),
                      options: CarouselOptions(animateToClosest: true,
                          height: height * 0.2,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currontIndex = index;
                            });
                          },
                          autoPlayInterval: const Duration(seconds: 2),),),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: imageList.map((e) {
                      int index = imageList.indexOf(e);
                      return Container(
                        width: 8,height: 8,
                        margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: currontIndex == index?Colors.white:Colors.black12
                        ),
                      );
                    }).toList()
                  ),

                  // trading sale image list
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                  Text(
                    LocaleKeys.trandingSale,
                    style: TextStyle(
                        fontSize: width * 0.05,
                        fontFamily: "Lalezar",
                        fontWeight: FontWeight.w400),
                  ),
                  IconButton(onPressed: () {

                  }, icon: Icon(Icons.more_horiz_rounded,color: Colors.black,size: width * 0.07,),)
                ],),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  SizedBox(
                    height: height * 0.2,
                    width: double.infinity,
                    child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: 6,itemBuilder: (context, index) {
                      return Container(width: width * 0.210,color: Colors.white,margin: EdgeInsets.symmetric(horizontal: 5),);
                    },),
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
