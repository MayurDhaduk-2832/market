// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sellproducts/constant/common.dart';
import 'package:sellproducts/constant/utils/size_utils.dart';
import 'package:sellproducts/constant/utils/text_style_constant.dart';
import 'package:sellproducts/modules/business/viewmodel/business_insert_viewmodel.dart';
import 'package:sellproducts/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BusinessAddScreen extends StatefulWidget {
  const BusinessAddScreen({super.key});

  @override
  State<BusinessAddScreen> createState() => _BusinessAddScreenState();
}

class _BusinessAddScreenState extends State<BusinessAddScreen> {
  final businessNameController = TextEditingController();
  final mobileController = TextEditingController();
  final addressController = TextEditingController();
  final whatsappLinkController = TextEditingController();
  final instagramLingController = TextEditingController();
  final pinCodeController = TextEditingController();

  final categorysController = TextEditingController();
  final countryController = TextEditingController();
  final stateController = TextEditingController();
  final cityController = TextEditingController();

  final List<String> category = [
    'effwef',
    'Nefewfewf',
    'React Natiwewfewefe',
    'Java',
    'Docker',
    'MySQL',
    'sfdg',
    'Mzdgszdf',
    'sdgsdzg',
  ];
  List<String> selectedCategory = [];


  late BusinessCreateViewModel _service;
  bool isSelectedImage = false;
  XFile? image;
  File? imageFile;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _service = BusinessCreateViewModel(context);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(resizeToAvoidBottomInset: false,
      body: Container(
        height: height,
        width: width,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height * 0.05,
              width: height * 0.05,
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 35),
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
            Center(
              child: GestureDetector(
                onTap: () async {
                  // final imagePicker = ImagePicker();
                  // final image =
                  //     await imagePicker.pickImage(source: ImageSource.gallery);
                  // if (image != null) {
                  //   imageFile = File(image.path);
                  //   print("image==> $imageFile");
                  // }
                  showSelectImage(context);
                  // image = await _picker.pickImage(source: ImageSource.gallery);
                  // print("image==>${image?.name}");

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
                  child: (isSelectedImage==true)?CircleAvatar(backgroundColor: Colors.white,backgroundImage: FileImage(File(image?.path ?? ""))): const Icon(
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
             SizedBox(height: height * 0.09,
               child: const Center(
                child: Text(
                  "Business Logo",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
            ),
             ),
            Expanded(

              child: ListView(
                children: [
                  CustomTextField(
                      isShowIcon: true,
                      icon: Icons.person,
                      controller: businessNameController,
                      hintText: "Enter Business Name"),
                  CustomTextField(keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10),
                      ],
                      isShowIcon: true,
                      icon: Icons.phone,
                      controller: mobileController,
                      hintText: "Enter Mobile Number"),


                  CustomMultipalDropDown(
                    onTap: () {
                      showSelectedItem();
                    },
                    selectedItems: selectedCategory,
                    icon: Icons.category,
                    isShowIcon: true,
                    image: "assets/flag.png", hintText: "Please select cetagoris",
                  ),


                  CustomDropDown(
                      itemList: ["dgsdgs","fdadff","afadfdf"],
                      icon: Icons.flag,
                      isShowIcon: true,
                      image: "assets/flag.png",
                      controller: countryController,

                      hintText: "Please Select Country"),

                  CustomDropDown(
                      icon: Icons.flag,
                      itemList: ['dfsdf','dfsdfd','dfsdf'],
                      image: "assets/state.png",
                      isShowIcon: false,
                      controller: stateController,
                      hintText: "Please Select State"),

                  CustomDropDown(
                      itemList: ['dfsdf','dfs'],
                      icon: Icons.location_city,
                      isShowIcon: true,
                      controller: cityController,
                      hintText: "Please Select City"),

                  CustomTextField(
                      isShowIcon: true,
                      icon: Icons.home,
                      controller: addressController,
                      hintText: "Enter Address"),
                  CustomTextField(keyboardType: TextInputType.number,
                      isShowIcon: true,
                      icon: Icons.pinch_outlined,
                      controller: pinCodeController,
                      hintText: "Enter Pincode"),
                  CustomTextField(
                    isShowIcon: false,
                      image: "assets/instagram.png",
                      icon: Icons.person,
                      controller: instagramLingController,
                      hintText: "Enter Instagram Page"),
                  CustomTextField(
                      isShowIcon: false,
                      image: "assets/whatsapp.png",
                      icon: Icons.person,
                      controller: whatsappLinkController,
                      hintText: "Enter Whatsapp Link"),
                ],
              ),
            ),
            GestureDetector(
              onTap: () async {
                if(businessNameController.text.isEmpty)
                {
                  flutterToastBottom("Enter Business Name");
                }
                else if(mobileController.text.isEmpty)
                {
                  flutterToastBottom("Enter Mobile Number");
                }
                else if(selectedCategory.isEmpty)
                {
                  flutterToastBottom("Enter Category");
                }
                else if(countryController.text.isEmpty)
                {
                  flutterToastBottom("Please Select Country");
                }
                else if(stateController.text.isEmpty)
                {
                  flutterToastBottom("Please Select State");
                }
                else if(cityController.text.isEmpty)
                {
                  flutterToastBottom("Please Select City");
                }
                else if(addressController.text.isEmpty)
                {
                  flutterToastBottom("Please Enter Your Address");
                }
                else if(pinCodeController.text.isEmpty)
                {
                  flutterToastBottom("Please Enter Pincode");
                }
                else
                  {
                    final response = await _service.register(
                        1,
                        businessNameController.text,
                        mobileController.text,
                        selectedCategory,
                        countryController.text,
                        stateController.text,
                        cityController.text,
                        addressController.text,
                        pinCodeController.text,
                        "",
                        "",
                        image?.name ?? ""
                    );
                    businessNameController.text = "";
                    mobileController.text = "";
                    selectedCategory=[];
                    countryController.text = "";
                    stateController.text = "";
                    cityController.text = "";
                    addressController.text = "";
                    pinCodeController.text = "";
                    isSelectedImage = false;

                    if (response?.isSuccess ?? false) {

                      flutterToastBottomGreen(response?.message);
                      Get.toNamed(Routes.HOME_VIEW);
                    } else {
                      // flutterToastBottom(response?.message);
                      flutterToastBottom("Incorrect Password");
                    }
                  }

                  setState(() {

                  });


              },
              child: Container(
                height: height * 0.065,
                width: width,
                alignment: Alignment.center,
                margin:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30)),
                child: const Text(
                  "Continue",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    letterSpacing: 0.9,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  showSelectedItem()
  {

      showDialog(context: context, builder: (context) {
        return SimpleDialog(title: const Text('Select categories'),children: [
          SizedBox(height: Get.height * 0.4,width: Get.width * 0.4,
            child: ListView.builder(itemCount: category.length,itemBuilder: (context, index) {
              return CheckboxListTile(
                value: selectedCategory.contains(category[index]),
                title: Text(category[index]),
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (isChecked) {
                  if (isChecked ?? false) {
                    selectedCategory.add(category[index]);

                  } else {
                    selectedCategory.remove(category[index]);
                  }
                  setState(() {

                  });

                },
              );
            },),
          ),
          Row(children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: height * 0.055,
                  width: width * 0.283,
                  alignment: Alignment.center,
                  margin:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30)),
                  child:  Text(
                      "Cancel",
                      style: openPopButtonStyle
                  ),
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
                  margin:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30)),
                  child:  Text(
                      "Submit",
                      style: openPopButtonStyle
                  ),
                ),
              ),
            ),
          ],)
        ],);
      },);
  }

  showSelectImage(BuildContext context)
  {
    showDialog(context: context, builder: (context) {
      return  SimpleDialog(alignment: Alignment.center,children: [
        Row(
          children: [
            Expanded(
              child: GestureDetector(onTap: () {
                Get.back();
              },
                child: Container(
                  height: height * 0.05,
                  width: width * 0.05,
                  margin:  EdgeInsets.only(bottom: height * 0.02,left: width * 0.02 ),
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
              ),
            ),
            Spacer(flex: 5,)
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
            child: (isSelectedImage==true)?CircleAvatar(backgroundColor:  Colors.white,backgroundImage: FileImage(File(image?.path ?? ""))): const Icon(
              Icons.person,
              size: 40,
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(
          height: height * 0.01,
        ),
          const Align(alignment: Alignment.center,
            child: Text("Select camara & gallery",style:  TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500),),
          ),
        SizedBox(
          height: height * 0.01,
        ),
        Row(children: [
          Expanded(
            child: GestureDetector(
              onTap: () async {
                Get.back();
                image = await _picker.pickImage(source: ImageSource.camera);
                setState(() {
                  isSelectedImage=true ;
                });

              },
              child: Container(
                height: height * 0.060,
                width: width * 0.280,
                alignment: Alignment.center,
                margin:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30)),
                child:  Text(
                  "Camera",
                  style: openPopButtonStyle
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () async {
                Get.back();
                image = await _picker.pickImage(source: ImageSource.gallery);
                setState(() {
                  isSelectedImage=true ;
                });

              },
              child: Container(
                height: height * 0.060,
                width: width * 0.280,
                alignment: Alignment.center,
                margin:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30)),
                child:  Text(
                  "Gallery",
                  style:openPopButtonStyle
                ),
              ),
            ),
          )
        ],)
      ],);
    },);
  }

}

class CustomTextField extends StatelessWidget {
  IconData icon;
  TextEditingController controller;
  String hintText;
  String? image;
  bool? isShowIcon;
  TextInputType? keyboardType;
  List<TextInputFormatter>? inputFormatters;

  CustomTextField(
      {super.key,
      required this.icon,
        this.image,
        this.isShowIcon,
        required this.controller,
        required this.hintText,
        this.keyboardType,
        this.inputFormatters
      });

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
            child: isShowIcon==true?Icon(
              icon,
              color: Colors.black,
            ):Image(height: Get.height * 0.010,image: AssetImage(image ?? "")),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: TextField(keyboardType: keyboardType,
                inputFormatters:inputFormatters ,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 17,
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
      this.onTap
      });

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
              margin: const EdgeInsets.only(left: 10, right: 15,top: 11,bottom: 11),
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
              child: isShowIcon==true?Icon(
                icon,
                color: Colors.black,
              ):Image(height: Get.height * 0.010,image: AssetImage(image ?? "")),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 4.0),
                child: (selectedItems.isEmpty)?
                    Text(hintText,style: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.6,
                    ),):Wrap(spacing: Get.width * 0.02,
                  children: selectedItems
                      .map((e) => Chip(
                    label: Text(e),
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

  CustomDropDown(
      {super.key,
        required this.icon,
        required this.itemList,
        this.isShowIcon,
        this.image,
        required this.controller,
        required this.hintText});

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
            child: isShowIcon==true?Icon(
              icon,
              color: Colors.black,
            ):Image(height: Get.height * 0.010,image: AssetImage(image ?? "")),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child:   CustomDropdown.search(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.6,
                ),
                items: itemList ?? [],
                controller: controller,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
