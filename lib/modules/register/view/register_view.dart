import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  @override
  void initState() {
    super.initState();
    if (argumentData != null && argumentData is Map<String, dynamic>) {
      iSelect = argumentData['setIndex'];
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: height,
            width: width,
            child: Image.network(
              "https://wallpaperaccess.com/full/2489679.jpg",
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
              top: height * 0.055,
              left: height * 0.025,
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.SELECT_VIEW);
                },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Icon(Icons.arrow_back),
                ),
              )),
          Positioned(
            top: height * 0.29,
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              height: height * 0.71,
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
                  const SizedBox(
                    height: 20,
                  ),
                  iSelect == 1
                      ? const Text(
                          "Create Customer Account",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      : const Text("Create Business Account",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    height: height * 0.35,
                    width: width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border:
                            Border.all(color: Colors.grey.shade500, width: 2)),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          height: height * 0.05,
                          child: TextField(
                            controller: usernameController,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Username",
                                hintStyle: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
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
                          padding: const EdgeInsets.all(5),
                          height: height * 0.05,
                          child: TextField(
                            controller: mobileController,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Mobile Number",
                                hintStyle: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
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
                          padding: const EdgeInsets.all(5),
                          height: height * 0.05,
                          child: TextField(
                            controller: emailController,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email Address",
                                hintStyle: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
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
                          padding: const EdgeInsets.all(5),
                          height: height * 0.05,
                          child: TextField(
                            controller: passwordController,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
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
                          padding: const EdgeInsets.all(5),
                          height: height * 0.05,
                          child: TextField(
                            controller: confirmPassController,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Confirm Password",
                                hintStyle: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: height * 0.05,
                    width: width,
                    decoration: BoxDecoration(
                        color: Colors.blue.shade700,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Text(
                      "Continue",
                      style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1,
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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
                      const Padding(
                        padding: EdgeInsets.only(left: 8, right: 8),
                        child: Text("OR"),
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
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: height * 0.055,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: Colors.grey.shade600, width: 1.5)),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Image.network(
                            "https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-suite-everything-you-need-know-about-google-newest-0.png",
                            height: 25,
                            width: 25,
                          ),
                        ),
                        const Expanded(
                          child: Center(
                            child: Text(
                              "Login With Google",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Already have an account?",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 5,
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
                          fontSize: 14,
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
    );
  }
}
