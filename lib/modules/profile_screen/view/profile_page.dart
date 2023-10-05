// ignore_for_file: must_be_immutable, invalid_use_of_protected_member

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sellproducts/constant/pref_service.dart';
import 'package:sellproducts/constant/utils/size_utils.dart';
import 'package:sellproducts/constant/utils/text_style_constant.dart';
import 'package:sellproducts/constants/locals.g.dart';
import 'package:sellproducts/customs/custom_textfield.dart';
import 'package:sellproducts/modules/profile_screen/profile_controller/profile_controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileScreenController profileScreenController =
      Get.put(ProfileScreenController());
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
            child: Padding(
              padding:  EdgeInsets.only(left: width * 0.03,right: width * 0.03),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
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
                    child:  Icon(Icons.arrow_back,size: width * 0.05,),
                  ),
                ),
                SizedBox(height: height * 0.03,),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Hello,",
                        style: TextStyle(
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.w200),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        PrefService.getString(LocaleKeys.SPUserName),
                        style: TextStyle(
                            fontSize: width * 0.05,
                            fontFamily: "PaytoneOne",
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    const Spacer(),
                    const Spacer(),
                    const Spacer(),
                    Expanded(
                      child: Image.asset(
                        "assets/User.png",
                        height: height * 0.04,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.04,),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          profileScreenController.iSelected.value = 1;
                        },
                        child: Container(alignment: Alignment.center,height: height * 0.05,decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow:  [
                            BoxShadow(
                                spreadRadius: 0,
                                // blurStyle: BlurStyle.outer,
                                offset: Offset(0, 4),
                                color: Colors.black.withOpacity(0.25),
                                blurRadius: 4
                            )
                          ],
                        ),
                          child: Text(LocaleKeys.yourProfile,style: TextStyle(fontSize: width * 0.04),)
                        ),
                      ),
                    ),
                    SizedBox(width: width * 0.04,),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          profileScreenController.iSelected.value = 2;
                        },
                        child: Container(alignment: Alignment.center,height: height * 0.05,decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          boxShadow:  [
                            BoxShadow(
                                spreadRadius: 0,
                                // blurStyle: BlurStyle.outer,
                                offset: Offset(0, 4),
                                color: Colors.black.withOpacity(0.25),
                                blurRadius: 4
                            )
                          ],
                        ),
                          child: Text(LocaleKeys.yourLists,style: TextStyle(fontSize: width * 0.04))
                        ),
                      ),
                    ),
                  ],
                ),
          Obx(() =>   profileScreenController.iSelected.value == 1?
          Expanded(
            child: Column(children: [
              SizedBox(height: height * 0.04,),
              Center(
                child: Text(
                  LocaleKeys.uploadProfilePicture,
                  style: TextStyle(
                      fontSize: width * 0.04,
                      fontFamily: "PaytoneOne",
                      fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(height: height * 0.02,),
              Center(
                child: GestureDetector(
                  onTap: () {
                    showSelectImage(context);
                  },
                  child: Container(
                    height: height * 0.1,
                    width: height * 0.1,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 5,
                          )
                        ],
                        borderRadius: BorderRadius.circular(height * 0.075)),
                    child:Obx(() =>  (profileScreenController.isSelectedImage.value == true)
                        ? CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: FileImage(File(profileScreenController.image?.path ?? "")))
                        : Image.asset(
                      "assets/profileUser.png",
                      height: height * 0.04,
                    ),)
                  ),
                ),
              ),
              Expanded(child:
              ListView.builder(physics: BouncingScrollPhysics(),
                itemCount: profileScreenController.profileList.length,itemBuilder: (context, index) {
                  return Column(children: [
                    SizedBox(height: height * 0.02,),
                    Obx(
                    ()=> TextFieldCommonWidget(
                        keyboardType: index == 1 ? TextInputType.number:TextInputType.text,
                        text: profileScreenController.profileList.value[index],
                        hintText: profileScreenController.profileList.value[index],
                        controller: profileScreenController.profileController.value[index],
                      ),
                    ),
                    SizedBox(height: height * 0.02,)
                  ],);
                },),
              )
            ],),
          ):SizedBox())

            ],),
            )
          ),
        ),
      ),
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
                  child: Obx(
                    () =>
                        (profileScreenController.isSelectedImage.value == true)
                            ? CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage: FileImage(File(
                                    profileScreenController.image?.path ?? "")))
                            : Image.asset(
                                "assets/profileUser.png",
                                height: height * 0.04,
                              ),
                  )),
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
                      profileScreenController.image =
                          await profileScreenController.picker
                              .pickImage(source: ImageSource.camera);
                      profileScreenController.isSelectedImage.value = true;
                      setState(() {});
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
                      profileScreenController.image =
                          await profileScreenController.picker
                              .pickImage(source: ImageSource.gallery);
                      profileScreenController.isSelectedImage.value = true;
                      setState(() {});
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
