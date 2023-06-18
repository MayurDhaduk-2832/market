import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sellproducts/routes/app_pages.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  dynamic argumentData = Get.arguments;
  int iSelect = 0;
  final mobileController = TextEditingController();
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
      body: SingleChildScrollView(
        child: Stack(
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
              top: height * 0.49,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                height: height * 0.51,
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
                      height: 15,
                    ),
                    iSelect == 1
                        ? const Text(
                            "Customer Account",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        : const Text("Business Account",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 20,
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
                            padding: const EdgeInsets.all(5),
                            height: height * 0.05,
                            child: TextField(
                              controller: mobileController,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Mobile Number",
                                  hintStyle: TextStyle(
                                      fontSize: 14,
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
                            padding: const EdgeInsets.all(8),
                            height: height * 0.05,
                            child: TextField(
                                controller: passwordController,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold))),
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
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Don't have an account?",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 5,
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
      ),
    );
  }
}
