import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sellproducts/AllStatic/color.dart';
import 'package:sellproducts/customs/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isSee = false;

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Container(
          color: LocalKeyColor.BackgroundColor,
          padding: const EdgeInsets.only(left: 20, right: 20),
          height: height,
          width: width,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Enter Mobile Number',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400,color: Colors.white),
                ),
                CustomSearchView(
                  inputType: TextInputType.number,
                  margin: const EdgeInsets.only(top: 15),
                  controller: emailController,
                  prefix: const Icon(Icons.person,color: Colors.white,),
                  fontStyle: SearchViewFontStyle.RobotoRomanRegular18,
                ),
                // const SizedBox(
                //   height: 25,
                // ),
                // const Text(
                //   'Enter Password',
                //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400,color: Colors.white),
                // ),
                // CustomSearchView(
                //   margin: const EdgeInsets.only(top: 15),
                //   controller: passwordController,
                //   prefix: const Icon(Icons.key_rounded,color: Colors.white),
                //   fontStyle: SearchViewFontStyle.RobotoRomanRegular18,
                //   obsecureText: isSee,
                //   suffix: IconButton(
                //     icon: Icon(isSee
                //         ? CupertinoIcons.eye_slash_fill
                //         : CupertinoIcons.eye_fill,color: Colors.white),
                //     onPressed: () {
                //       isSee = !isSee;
                //       setState(() {});
                //     },
                //   ),
                // ),
                const SizedBox(
                  height: 25,
                ),
                // const Text(
                //   'Forget Password?',
                //   style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500,color: Colors.white),
                // ),
                const SizedBox(
                  height: 25,
                ),


                Material(
                  elevation: 1,
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 375,
                    child: const Text(
                      "Log In",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Row(
                  children: [
                    Expanded(
                      child: Divider(
                      color: Colors.white,
                        thickness: 0.7,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'OR',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500,color: Colors.white),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.white,
                        thickness: 0.7,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                /// Facebook signing
                Material(
                  elevation: 1,
                  borderRadius: BorderRadius.circular(8),
                  child: GestureDetector(
                    onTap: signInWithGoogle,
                    child: SizedBox(
                      height: 40,
                      width: 375,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 25,
                            width: 50,
                            child: Image.network(
                              'https://img.freepik.com/free-icon/search_318-265161.jpg',
                            ),
                          ),
                          const Expanded(
                            child: Center(
                              child: Text(
                                'Login With Google',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                /// google signing
                Material(
                  elevation: 1,
                  borderRadius: BorderRadius.circular(8),
                  child: SizedBox(
                    height: 40,
                    width: 375,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 25,
                          width: 50,
                          child: Image.network(
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_%282019%29.png/1024px-Facebook_Logo_%282019%29.png'),
                        ),
                        const Expanded(
                          child: Center(
                            child: Text(
                              'Login With Facebook',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

              ]),
        ),
      ),
    );
  }
}
