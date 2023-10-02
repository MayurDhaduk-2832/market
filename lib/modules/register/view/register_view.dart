import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sellproducts/constant/common.dart';
import 'package:sellproducts/constant/pref_service.dart';
import 'package:sellproducts/constants/locals.g.dart';
import 'package:sellproducts/customs/custom_continue_button.dart';
import 'package:sellproducts/customs/custom_textfield.dart';
import 'package:sellproducts/modules/register/controller/register_controller.dart';
import 'package:sellproducts/modules/register/viewmodel/register_view_model.dart';
import 'package:sellproducts/routes/app_pages.dart';

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
  late RegisterViewModel service;

  RegisterController registerController = Get.put(RegisterController());

  @override
  void initState() {
    super.initState();
    service = RegisterViewModel(context);
    if (argumentData != null && argumentData is Map<String, dynamic>) {
      iSelect = argumentData['setIndex'];
    }
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        color: Colors.brown.shade50,
        padding: const EdgeInsets.symmetric(horizontal: 25),

        child:SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.07,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                width: width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 7),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sign Up to Your \nAccount",
                      style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: height * 0.02),
                    // user name
                    TextFieldCommonWidget(text: "Username",hintText: "Enter UserName",controller: registerController.usernameController),
                    // email id
                    SizedBox(height: height * 0.02),
                    TextFieldCommonWidget(text: "Email id",hintText: "Enter Email id",controller: registerController.emailController),
                    // Mobile No
                    SizedBox(height: height * 0.02),
                    TextFieldCommonWidget(inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10),
                    ],text: "Mobile No.",hintText: "Enter Mobile No.",controller: registerController.mobileController),
                    // password
                    SizedBox(height: height * 0.02),
                    TextFieldCommonWidget(text: "Password",hintText: "Enter Password",controller: registerController.passwordController),
                    //Confirm password
                    SizedBox(height: height * 0.02),
                    TextFieldCommonWidget(text: "Confirm Password",hintText: "Enter Confirm Password",controller: registerController.confirmPassController),
                    // continue button
                    ContinueButtonCommonWidget(text:'Continue ->',onTap: () {
                      if(registerController.usernameController.text.isEmpty)
                        {
                          flutterToastBottom("Please Enter Username");
                        }
                      else if(registerController.emailController.text.isEmpty)
                        {
                          flutterToastBottom("Please Enter Email");
                        }
                      else if(registerController.mobileController.text.isEmpty)
                      {
                        flutterToastBottom("Please Enter Mobile No.");
                      }
                      else if(registerController.passwordController.text.isEmpty)
                        {
                          flutterToastBottom("Please Enter Password");
                        }
                      else if(registerController.confirmPassController.text.isEmpty)
                      {
                        flutterToastBottom("Please Enter Confirm Password");
                      }
                      else if(registerController.passwordController.text!=registerController.confirmPassController.text)
                        {
                          flutterToastBottom("Please Enter Valid Conform Password");
                        }
                      else
                        {
                          registerController.registerUser( PrefService.getInt( LocaleKeys.SPUSetRole));
                          Get.toNamed(Routes.LANGUAGE_VIEW);
                        }


                    },),
                  ],
                ),
              ),
              SizedBox(height: height * 0.03),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.LOGIN_VIEW);
                },
                child: Container(
                  height: height * 0.08,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(45),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 7),
                      ),
                    ],
                  ),
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account ?",
                        style: TextStyle(fontSize: width * 0.04, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Sign In Now",
                        style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xffB59669),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
