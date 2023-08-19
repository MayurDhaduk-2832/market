import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sellproducts/constants/locals.g.dart';
import 'package:sellproducts/customs/custom_continue_button.dart';
import 'package:sellproducts/customs/custom_textfield.dart';
import 'package:sellproducts/modules/login/viewmodel/login_view_model.dart';
import 'package:sellproducts/routes/app_pages.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  dynamic argumentData = Get.arguments;
  int iSelect = 0;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late LoginViewModel _service;
  @override
  void initState() {
    super.initState();
    _service = LoginViewModel(context);
    if (argumentData != null && argumentData is Map<String, dynamic>) {
      iSelect = argumentData['setIndex'];
    }
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(    resizeToAvoidBottomInset: false,
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration( color: Colors.brown.shade50,image: DecorationImage(fit: BoxFit.cover,image: AssetImage(  "assets/asset1.png",))),
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.22,
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
                          offset: const Offset(0, 7))
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      "Sign In to Your \nAccount",
                      style: TextStyle(fontSize: width * 0.05, fontWeight: FontWeight.bold),
                    ),
                     SizedBox(
                      height: height * 0.03,
                    ),
                    SizedBox(height: height * 0.02),
                    TextFieldCommonWidget(text: "Email id",hintText: "Enter Email id",controller: emailController),
                    SizedBox(height: height * 0.02),
                    TextFieldCommonWidget(text: "Password",hintText: "Enter Password",controller: emailController),
                    // continue button
                    SizedBox(
                      height: height * 0.03,
                    ),
                    ContinueButtonCommonWidget(text:'Continue ->'),
                    SizedBox(
                      height: height * 0.02,
                    ),



                  ],
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.REGISTER_VIEW);
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
                            offset: Offset(0, 7))
                      ]),
                  child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account ?",
                          style: TextStyle(
                              fontSize: width * 0.04, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Create new Account",
                          style: TextStyle(
                              fontSize: width * 0.04,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffB59669)),
                        )
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
