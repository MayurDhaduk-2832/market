// ignore_for_file: must_be_immutable, invalid_use_of_protected_member

import 'dart:io';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sellproducts/constant/common.dart';
import 'package:sellproducts/constant/utils/size_utils.dart';
import 'package:sellproducts/constant/utils/text_style_constant.dart';
import 'package:sellproducts/constants/locals.g.dart';
import 'package:sellproducts/customs/custom_continue_button.dart';
import 'package:sellproducts/modules/business/business_controller/business_controller.dart';
import 'package:sellproducts/modules/business/viewmodel/business_insert_viewmodel.dart';
import 'package:sellproducts/modules/home/home_controller/home_controller.dart';

class BusinessAddScreen extends StatefulWidget {
  const BusinessAddScreen({super.key});

  @override
  State<BusinessAddScreen> createState() => _BusinessAddScreenState();
}

class _BusinessAddScreenState extends State<BusinessAddScreen> {
  BusinessScreenController businessScreenController =
      Get.put(BusinessScreenController());
  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  late BusinessCreateViewModel _service;
  bool isSelectedImage = false;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async{
        businessScreenController.openKeyBoard.value = false;
        return false;
      },
      child: Scaffold(
        backgroundColor:  Colors.brown.shade50,
       // resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            height: height,
            width: width,
            color: Colors.brown.shade50,
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: height * 0.05,
                      width: height * 0.05,
                      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 4)
                        ],
                      ),
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.black,
                      ),
                    ),

                    Expanded(flex: 5,
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        children: [
                          Center(
                            child: GestureDetector(
                              onTap: () async {
                                showSelectImage(context);
                              },
                              child: Container(
                                height: height * 0.13,
                                width: height * 0.13,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        blurRadius: 5,
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(height * 0.075)),
                                child: (isSelectedImage == true)
                                    ? CircleAvatar(
                                    backgroundColor: Colors.white,
                                    backgroundImage: FileImage(File(businessScreenController.image?.path ?? "")))
                                    : const Icon(
                                  Icons.person,
                                  size: 40,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          SizedBox(
                            height: height * 0.09,
                            child: Center(
                              child: Text(
                                "Business Logo",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.06,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          CustomTextField(
                            onTap: () {
                              businessScreenController.openKeyBoard.value = true;
                            },
                            isShowIcon: true,
                            icon: Icons.person,
                            controller: businessScreenController.businessNameController,
                            hintText: "Enter Business Name",
                            onSubmitted: (value) {
                              businessScreenController.openKeyBoard.value = false;
                            },
                          ),
                          CustomTextField(
                            onTap: () {
                              businessScreenController.openKeyBoard.value = true;
                            },
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(10),
                            ],
                            isShowIcon: true,
                            icon: Icons.phone,
                            controller: businessScreenController.mobileController,
                            hintText: "Enter Mobile Number",
                            onSubmitted: (value) {
                              businessScreenController.openKeyBoard.value = false;
                            },
                          ),
                          Obx(
                            () => CustomMultipalDropDown(
                              onTap: () {
                                showSelectedItem();
                              },
                              selectedItems:
                                  businessScreenController.selectedCategory.value,
                              icon: Icons.category,
                              isShowIcon: true,
                              image: "assets/flag.png",
                              hintText: "Please select cetagoris",
                            ),
                          ),
                          CustomTextField(
                            onTap: () {
                              businessScreenController.openKeyBoard.value = true;
                              showCountryPicker(
                                context: context,
                                countryListTheme: CountryListThemeData(
                                  flagSize: 25,
                                  backgroundColor: Colors.brown.shade50,
                                  textStyle: const TextStyle(
                                      fontSize: 16, color: Colors.blueGrey),
                                  bottomSheetHeight:
                                      500, // Optional. Country list modal height
                                  //Optional. Sets the border radius for the bottomsheet.
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                  ),
                                  //Optional. Styles the search field.
                                  inputDecoration: const InputDecoration(
                                    focusedBorder:
                                        OutlineInputBorder(borderSide: BorderSide()),
                                    labelText: 'Search',
                                    labelStyle: TextStyle(color: Colors.black),
                                    hintText: 'Start typing to search',
                                    prefixIcon: Icon(Icons.search, color: Colors.black),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                onSelect: (value) {
                                  businessScreenController.countryController.text =
                                      value.name;
                                  setState(() {});
                                },
                              );
                            },
                            isShowIcon: true,
                            keyboardType: TextInputType.none,
                            icon: Icons.flag,
                            controller: businessScreenController.countryController,
                            hintText: "Please Select Country",
                            onSubmitted: (value) {
                              businessScreenController.openKeyBoard.value = false;
                            },
                          ),
                          CustomDropDown(
                              icon: Icons.flag,
                              itemList: ['dfsdf', 'dfsdfd', 'dfsdf'],
                              image: "assets/state.png",
                              isShowIcon: false,
                              controller: businessScreenController.stateController,
                              hintText: "Please Select State"),
                          CustomDropDown(
                              itemList: ['dfsdf', 'dfs'],
                              icon: Icons.location_city,
                              isShowIcon: true,
                              controller: businessScreenController.cityController,
                              hintText: "Please Select City"),
                          CustomTextField(
                            onTap: () {
                              businessScreenController.openKeyBoard.value = true;
                            },
                            isShowIcon: true,
                            icon: Icons.home,
                            controller: businessScreenController.addressController,
                            hintText: "Enter Address",
                            onSubmitted: (value) {
                              businessScreenController.openKeyBoard.value = false;
                            },
                          ),
                          CustomTextField(
                            onTap: () {
                              businessScreenController.openKeyBoard.value = true;
                            },
                            keyboardType: TextInputType.number,
                            isShowIcon: true,
                            icon: Icons.pinch_outlined,
                            controller: businessScreenController.pinCodeController,
                            hintText: "Enter Pincode",
                            onSubmitted: (value) {
                              businessScreenController.openKeyBoard.value = false;
                            },
                          ),
                          CustomTextField(
                            onTap: () {
                              businessScreenController.openKeyBoard.value = true;
                            },
                            isShowIcon: false,
                            image: "assets/instagram.png",
                            icon: Icons.person,
                            controller:
                                businessScreenController.instagramLingController,
                            hintText: "Enter Instagram Page",
                            onSubmitted: (value) {
                              businessScreenController.openKeyBoard.value = false;
                            },
                          ),
                          CustomTextField(
                            onTap: () {
                              businessScreenController.openKeyBoard.value = true;
                            },
                            isShowIcon: false,
                            image: "assets/whatsapp.png",
                            icon: Icons.person,
                            controller: businessScreenController.whatsappLinkController,
                            hintText: "Enter Whatsapp Link",
                            onSubmitted: (value) {
                              businessScreenController.openKeyBoard.value = false;
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: width * 0.04,
                                right: width * 0.04,
                                bottom:    businessScreenController.openKeyBoard.value?0:height * 0.03),
                            child: ContinueButtonCommonWidget(
                              text: 'Continue ->',
                              onTap: () async {
                                if (businessScreenController
                                    .businessNameController.text.isEmpty) {
                                  flutterToastBottom("Enter Business Name");
                                } else if (businessScreenController
                                    .mobileController.text.isEmpty) {
                                  flutterToastBottom("Enter Mobile Number");
                                } else if (businessScreenController
                                    .selectedCategory.value.isEmpty) {
                                  flutterToastBottom("Enter Category");
                                } else if (businessScreenController
                                    .countryController.text.isEmpty) {
                                  flutterToastBottom("Please Select Country");
                                } else if (businessScreenController
                                    .stateController.text.isEmpty) {
                                  flutterToastBottom("Please Select State");
                                } else if (businessScreenController
                                    .cityController.text.isEmpty) {
                                  flutterToastBottom("Please Select City");
                                } else if (businessScreenController
                                    .addressController.text.isEmpty) {
                                  flutterToastBottom("Please Enter Your Address");
                                } else if (businessScreenController
                                    .pinCodeController.text.isEmpty) {
                                  flutterToastBottom("Please Enter Pincode");
                                } else {
                                  await businessScreenController.uploadImage();
                                  await businessScreenController.addBusiness();
                                }
                                businessScreenController.openKeyBoard.value = false;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
                Obx(() =>businessScreenController.isLoad.value==true?const Center(child: CupertinoActivityIndicator(color: Colors.black,animating: true,radius: 12),):SizedBox()),
              ],
            ),
          ),
        ),
      ),
    );
  }
  showSelectedItem() {
    showDialog(
      context: context,
      builder: (context) {
        return GetBuilder<BusinessScreenController>(
          id: "catodory",
          builder: (controller) {
            return SimpleDialog(
              backgroundColor: Colors.brown.shade50,
              title: const Text(LocaleKeys.selectCategories),
              children: [
                SizedBox(
                    height: height * 0.4,
                    width: width * 0.7,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount:
                      homeScreenController.categoryModel.categories?.length,
                      itemBuilder: (context, index) {
                        final category =  homeScreenController.categoryModel.categories?[index].category ?? "";
                        final isSelected = businessScreenController.selectedCategory.value.contains(category);

                        return CheckboxListTile(secondary:  CircleAvatar(backgroundColor:  Colors.brown.shade50,
                            backgroundImage: NetworkImage("https://mdprojects1203.000webhostapp.com/${homeScreenController.categoryModel.categories?[index].categoryImage ?? ""}")),
                          activeColor: Colors.black,
                          value: isSelected,
                          title: Text(homeScreenController.categoryModel.categories?[index].category ?? ""),
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (isChecked) {
                            if (isChecked ?? false) {
                              if (!isSelected) {
                                if (!businessScreenController
                                    .selectedCategory.value
                                    .contains(category)) {
                                  businessScreenController
                                      .selectedCategory.value
                                      .add(category);
                                  businessScreenController.selectedCategory
                                      .refresh();
                                  controller.update(['catodory']);
                                }
                              }
                            } else {
                              if (isSelected) {
                                businessScreenController.selectedCategory.value
                                    .remove(category);
                                businessScreenController.selectedCategory
                                    .refresh();
                                controller.update(['catodory']);
                              }
                            }
                          },
                        );
                      },
                    )),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          businessScreenController.selectedCategory.value
                              .clear();
                          businessScreenController.selectedCategory.refresh();
                          controller.update(['catodory']);
                          Get.back();
                        },
                        child: Container(
                          height: height * 0.055,
                          width: width * 0.283,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    blurRadius: 10,
                                    offset: const Offset(0, 5))
                              ]),
                          child: Text("Cancel", style: openPopButtonStyle),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: height * 0.055,
                          width: width * 0.283,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.3),
                                    blurRadius: 10,
                                    offset: const Offset(0, 5))
                              ]),
                          child: Text("Submit", style: openPopButtonStyle),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            );
          },
        );
      },
    );
  }

  showSelectImage(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          backgroundColor: Colors.brown.shade50,
          alignment: Alignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: height * 0.05,
                      width: width * 0.05,
                      margin: EdgeInsets.only(
                          bottom: height * 0.02, left: width * 0.02),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 4)
                        ],
                      ),
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const Spacer(
                  flex: 5,
                )
              ],
            ),
            Center(
              child: Container(
                height: height * 0.09,
                width: height * 0.09,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 5,
                      )
                    ],
                    borderRadius: BorderRadius.circular(height * 0.075)),
                child: (isSelectedImage == true)
                    ? CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: FileImage(File(businessScreenController.image?.path ?? "")))
                    : const Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.black,
                      ),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Select camara & gallery",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      Get.back();
                      businessScreenController.image =
                          await businessScreenController.picker.pickImage(source: ImageSource.camera);
                      setState(() {
                        isSelectedImage = true;
                      });
                    },
                    child: Container(
                      height: height * 0.060,
                      width: width * 0.280,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 10,
                                offset: const Offset(0, 5))
                          ]),
                      child: Text("Camera", style: openPopButtonStyle),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      Get.back();
                      businessScreenController.image =
                          await businessScreenController.picker.pickImage(source: ImageSource.gallery);
                      setState(() {
                        isSelectedImage = true;
                      });
                    },
                    child: Container(
                      height: height * 0.060,
                      width: width * 0.280,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 10,
                                offset: const Offset(0, 5))
                          ]),
                      child: Text("Gallery", style: openPopButtonStyle),
                    ),
                  ),
                )
              ],
            )
          ],
        );
      },
    );
  }
}

class CustomTextField extends StatelessWidget {
  IconData? icon;
  TextEditingController controller;
  String hintText;
  String? image;
  bool? isShowIcon;
  TextInputType? keyboardType;
  List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onSubmitted;

  CustomTextField(
      {super.key,
      this.icon,
      this.image,
      this.isShowIcon,
      required this.controller,
      required this.hintText,
      this.keyboardType,
      this.inputFormatters,
      this.focusNode,
      this.onTap,
      this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.067,
      width: width,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 5,
            offset: const Offset(-2, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: height * 0.045,
            width: height * 0.045,
            margin: const EdgeInsets.only(left: 10, right: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 2,
                ),
              ],
            ),
            child: isShowIcon == true
                ? Icon(
                    icon,
                    color: Colors.black,
                    size: width * 0.05,
                  )
                : Image.asset(image ?? ""),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: TextField(
                onSubmitted: onSubmitted,
                cursorColor: Colors.black,
                onTap: onTap,
                focusNode: focusNode,
                keyboardType: keyboardType,
                inputFormatters: inputFormatters,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.w500),
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.6,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomMultipalDropDown extends StatelessWidget {
  IconData icon;
  String hintText;
  String? image;
  List<String> selectedItems;
  bool? isShowIcon;
  GestureTapCallback? onTap;

  CustomMultipalDropDown(
      {super.key,
      required this.icon,
      this.image,
      this.isShowIcon,
      required this.selectedItems,
      required this.hintText,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 5,
              offset: const Offset(-2, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: height * 0.045,
              width: height * 0.045,
              margin: const EdgeInsets.only(
                  left: 10, right: 15, top: 11, bottom: 11),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 2,
                  ),
                ],
              ),
              child: isShowIcon == true
                  ? Icon(
                      icon,
                      color: Colors.black,
                      size: width * 0.05,
                    )
                  : Image(
                      height: Get.height * 0.010,
                      image: AssetImage(image ?? "")),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: (selectedItems.isEmpty)
                    ? Text(
                        hintText,
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.6,
                        ),
                      )
                    : Wrap(
                        spacing: Get.width * 0.02,
                        children: selectedItems
                            .map((e) => Chip(
                                  label: Text(
                                    e,
                                    style: TextStyle(fontSize: width * 0.03),
                                  ),
                                ))
                            .toList(),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDropDown extends StatelessWidget {
  IconData icon;
  TextEditingController controller;
  String hintText;
  String? image;
  bool? isShowIcon;
  final List<String>? itemList;
  final GestureTapCallback? onTap;

  CustomDropDown(
      {super.key,
      required this.icon,
      required this.itemList,
      this.isShowIcon,
      this.image,
      required this.controller,
      required this.hintText,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.067,
      width: width,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 5,
            offset: const Offset(-2, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: height * 0.045,
            width: height * 0.045,
            margin: const EdgeInsets.only(left: 10, right: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 2,
                ),
              ],
            ),
            child: isShowIcon == true
                ? Icon(
                    icon,
                    color: Colors.black,
                    size: width * 0.05,
                  )
                : Image(
                    height: Get.height * 0.010, image: AssetImage(image ?? "")),
          ),
          Expanded(
            child: GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: CustomDropdown.search(
                  listItemStyle: TextStyle(fontSize: width * 0.04),
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.6,
                  ),
                  items: itemList ?? [],
                  selectedStyle: TextStyle(fontSize: width * 0.04),
                  controller: controller,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
