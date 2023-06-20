import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sellproducts/constant/common.dart';
import 'package:sellproducts/constants/locals.g.dart';
import 'package:sellproducts/modules/register/viewmodel/register_view_model.dart';
import 'package:sellproducts/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  int iSelect = 0;
  dynamic argumentData = Get.arguments;
  final usernameController = TextEditingController();
  final mobileController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPassController = TextEditingController();

  late RegisterViewModel _service;

  @override
  void initState() {
    super.initState();
    _service = RegisterViewModel(context);
    if (argumentData != null && argumentData is Map<String, dynamic>) {
      iSelect = argumentData['setIndex'];
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: height,
              width: width,
              child: Image.network(
                "https://wallpaperaccess.com/full/2489679.jpg",
                fit: BoxFit.fill,
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
                )),
            Positioned(
              top: height * 0.28,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                height: height * 0.72,
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
                    iSelect == 1
                        ? Text(
                            LocaleKeys.createCAccount,
                            style: TextStyle(
                                fontSize: height * 0.025,
                                fontWeight: FontWeight.bold),
                          )
                        : Text(LocaleKeys.createBAccount,
                            style: TextStyle(
                                fontSize: height * 0.025,
                                fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      height: height * 0.35,
                      width: width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                              color: Colors.grey.shade500, width: 2)),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                left: height * 0.015, bottom: height * 0.005),
                            height: height * 0.05,
                            child: TextField(
                              controller: usernameController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: LocaleKeys.username,
                                  hintStyle: TextStyle(
                                      fontSize: height * 0.0185,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey.shade400,
                              height: 1,
                              thickness: 2,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: height * 0.015, bottom: height * 0.005),
                            height: height * 0.05,
                            child: TextField(
                              controller: mobileController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: LocaleKeys.mobileNumber,
                                  hintStyle: TextStyle(
                                      fontSize: height * 0.0185,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey.shade400,
                              height: 1,
                              thickness: 2,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: height * 0.015, bottom: height * 0.005),
                            height: height * 0.05,
                            child: TextField(
                              controller: emailController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: LocaleKeys.email,
                                  hintStyle: TextStyle(
                                      fontSize: height * 0.0185,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey.shade400,
                              height: 1,
                              thickness: 2,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: height * 0.015, bottom: height * 0.005),
                            height: height * 0.05,
                            child: TextField(
                              controller: passwordController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: LocaleKeys.password,
                                  hintStyle: TextStyle(
                                      fontSize: height * 0.0185,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey.shade400,
                              height: 1,
                              thickness: 2,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: height * 0.015, bottom: height * 0.005),
                            height: height * 0.05,
                            child: TextField(
                              controller: confirmPassController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Confirm Password",
                                  hintStyle: TextStyle(
                                      fontSize: height * 0.0185,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    GestureDetector(
                      onTap: () async {
                        final vUsername = usernameController.text;
                        final vMobile = mobileController.text;
                        final vEmail = emailController.text;
                        final vPassword = passwordController.text;
                        final vCPassword = confirmPassController.text;

                        if (vUsername.isEmpty) {
                          flutterToastBottom("Enter Username");
                        } else if (vMobile.isEmpty) {
                          flutterToastBottom("Enter Mobile Number");
                        } else if (vMobile.length != 10) {
                          flutterToastBottom("Enter valid Mobile No.");
                        } else if (vEmail.isEmpty) {
                          flutterToastBottom("Enter Email");
                        } else if (!vEmail.contains('@')) {
                          flutterToastBottom("Enter valid Email");
                        } else if (vPassword.isEmpty) {
                          flutterToastBottom("Enter Password");
                        } else if (vPassword.length < 8) {
                          flutterToastBottom(
                              "Password length must be 8 or above");
                        } else if (vCPassword.isEmpty) {
                          flutterToastBottom("Enter Confirm Password");
                        } else if (vPassword != vCPassword) {
                          flutterToastBottom("Enter Same Password");
                        } else {
                          final response = await _service.register(
                              vUsername, vMobile, vEmail, vPassword, iSelect);
                          print("=====================$response==============");
                          if (response?.isSuccess ?? false) {
                            final prefs = await SharedPreferences.getInstance();
                            prefs.setBool('LOGIN_KEY', true);
                            print(
                                "=================================success============");
                            Get.offAndToNamed(Routes.SELECT_VIEW);
                          } else {
                            print(
                                "======================fail=======================");
                            flutterToastBottom(response?.message);
                          }
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: height * 0.05,
                        width: width,
                        decoration: BoxDecoration(
                            color: Colors.blue.shade700,
                            borderRadius:
                                BorderRadius.circular(height * 0.025)),
                        child: Text(
                          LocaleKeys.signUp,
                          style: TextStyle(
                              color: Colors.white,
                              letterSpacing: 1,
                              fontSize: height * 0.02,
                              fontWeight: FontWeight.w700),
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
                    Container(
                      height: height * 0.055,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(height * 0.025),
                          border: Border.all(
                              color: Colors.grey.shade600, width: 1.5)),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 10),
                            child: Image.network(
                              "https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-suite-everything-you-need-know-about-google-newest-0.png",
                              height: height * 0.03,
                              width: height * 0.03,
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                LocaleKeys.loginGoogle,
                                style: TextStyle(
                                  fontSize: height * 0.02,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                          fontSize: height * 0.018,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: height * 0.001,
                    ),
                    GestureDetector(
                      onTap: () {
                        Map<String, dynamic> map = {
                          'setIndex': iSelect,
                        };
                        Get.offAndToNamed(Routes.LOGIN_VIEW, arguments: map);
                      },
                      child: Text(
                        "Login Now",
                        style: TextStyle(
                            fontSize: height * 0.018,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue.shade700),
                      ),
                    )
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
