
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sellproducts/constant/common.dart';
import 'package:sellproducts/constants/locals.g.dart';
import 'package:sellproducts/modules/login/viewmodel/login_view_model.dart';
import 'package:sellproducts/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

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



  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
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
              top: height * 0.47,
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
                    iSelect == 1
                        ? Text(
                            LocaleKeys.customer,
                            style: TextStyle(
                                fontSize: height * 0.025,
                                fontWeight: FontWeight.bold),
                          )
                        : Text(LocaleKeys.business,
                            style: TextStyle(
                                fontSize: height * 0.025,
                                fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      height: height * 0.15,
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
                              controller: emailController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: LocaleKeys.emailId,
                                hintStyle: TextStyle(
                                    fontSize: height * 0.0185,
                                    fontWeight: FontWeight.bold),
                              ),
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
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    GestureDetector(onTap: () async {
                      final email = emailController.text;
                      final password = passwordController.text;
                      if(email.isEmpty)
                        {
                          flutterToastBottom("Enter Email Id");
                        }
                      else if(password.isEmpty)
                        {
                          flutterToastBottom("Enter Password");
                        }
                      else
                        {
                          final response = await _service.login(email,password);
                          if (response?.isSuccess ?? false) {
                            flutterToastBottomGreen(response?.message);
                            final prefs = await SharedPreferences.getInstance();
                            prefs.setBool('LOGIN_KEY', true);
                            Map<String, dynamic> map = {
                              'setIndex': iSelect,
                            };
                            Get.toNamed(Routes.LANGUAGE_VIEW,arguments: map);
                          } else {
                            // flutterToastBottom(response?.message);
                            flutterToastBottom("Incorrect Password");
                          }
                        }


                      setState(() {});
                    },
                      child: Container(
                        alignment: Alignment.center,
                        height: height * 0.05,
                        width: width,
                        decoration: BoxDecoration(
                            color: Colors.blue.shade700,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          LocaleKeys.logIn,
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
                    GestureDetector(
                      onTap: signInWithGoogle,
                      child: Container(
                        height: height * 0.055,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
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
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                          fontSize: height * 0.0185,
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
                        Get.offAndToNamed(Routes.REGISTER_VIEW, arguments: map);
                      },
                      child: Text(
                        "Create new Account",
                        style: TextStyle(
                            fontSize: height * 0.0185,
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
