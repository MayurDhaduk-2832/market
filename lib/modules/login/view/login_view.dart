import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sellproducts/constants/locals.g.dart';
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
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        color: Colors.brown.shade50,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.25,
            ),
            Container(
              height: height * 0.57,
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
                  const Text(
                    "Sign In to Your \nAccount",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Username / Mobile No.*",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: height * 0.055,
                    width: width,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 10,
                              offset: const Offset(0, 5))
                        ]),
                    child: const Expanded(
                      child: TextField(
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Password",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: height * 0.055,
                    width: width,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 10,
                              offset: const Offset(0, 5))
                        ]),
                    child: const Expanded(
                      child: TextField(
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: height * 0.055,
                    width: width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 10,
                              offset: const Offset(0, 5))
                        ]),
                    child: const Text(
                      "Continue ->",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                            child: Divider(
                          color: Colors.grey.shade500,
                          height: 1,
                        )),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text("OR"),
                        ),
                        Expanded(
                            child: Divider(
                          color: Colors.grey.shade500,
                          height: 1,
                        )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
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
                ],
              ),
            ),
            SizedBox(height: height * 0.04),
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
                child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account ?",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Create new Account",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffB59669)),
                      )
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
