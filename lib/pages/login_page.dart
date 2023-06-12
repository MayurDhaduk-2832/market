import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Container(
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
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Enter Email',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                CustomSearchView(
                  margin: const EdgeInsets.only(top: 15),
                  controller: emailController,
                  prefix: const Icon(Icons.person),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'Enter Password',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                CustomSearchView(
                  margin: const EdgeInsets.only(top: 15),
                  controller: passwordController,
                  prefix: const Icon(Icons.key_rounded),
                  obsecureText: isSee,
                  suffix: IconButton(
                    icon: Icon(isSee
                        ? CupertinoIcons.eye_slash_fill
                        : CupertinoIcons.eye_fill),
                    onPressed: () {
                      isSee = !isSee;
                      setState(() {});
                    },
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  'Forget Password?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
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
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: const [
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        thickness: 0.7,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'OR',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        thickness: 0.7,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Material(
                  elevation: 1,
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    height: 40,
                    width: 375,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          height: 25,
                          width: 25,
                          child: Image.network(
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_%282019%29.png/1024px-Facebook_Logo_%282019%29.png'),
                        ),
                        const Text(
                          'Login With Facebook',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Material(
                  elevation: 1,
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    height: 40,
                    width: 375,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          height: 25,
                          width: 25,
                          child: Image.network(
                              'https://img.freepik.com/free-icon/search_318-265161.jpg'),
                        ),
                        const Text(
                          'Login With Google',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
