import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sellproducts/AllStatic/color.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: Login(),
  ));
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: h / 1,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/loginBackground.jpg"),
          ),
        ),
        child: SingleChildScrollView(clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(children: [
            SizedBox(
              height: h / 5,
            ),
            Text(
              "Login",
              style: TextStyle(color: LocalKeyColor.WhiteColor, fontSize: 25),
            ),
            SizedBox(
              height: h / 20,
            ),
            Container(
              margin: const EdgeInsets.all(30),
              child: TextField(
                  keyboardAppearance: Brightness.light,
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.next,
                  style: TextStyle(color: LocalKeyColor.WhiteColor),
                  cursorColor: LocalKeyColor.WhiteColor,
                  decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: CupertinoColors.white),
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: CupertinoColors.white),
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                      hintStyle: TextStyle(color: CupertinoColors.inactiveGray),
                      hintText: "Enter User Name & Mobile Number")),
            ),
          ]),
        ),
      ),
    );
  }
}
