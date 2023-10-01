import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class TextFieldCommonWidget extends StatelessWidget {
  late String? hintText;
  late bool? obscureText;
  TextEditingController? controller;
  late bool? isShowViciblity;
  final String? text;
  TextInputType? keyboardType;


  TextFieldCommonWidget({
    super.key,
    this.hintText,
    this.obscureText,
    this.controller,
    this.isShowViciblity,
    this.text,
    this.keyboardType
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(
          fit: BoxFit.contain,
          child: Text(
            text ?? "",
            style:  TextStyle(fontSize: width * 0.04, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: height * 0.01),
        Container(
          alignment: Alignment.center,
          height: height * 0.065,
          width: width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Padding(
            padding:  EdgeInsets.only(left: width * 0.03),
            child: TextField(controller: controller,cursorColor: Colors.black,obscureText: obscureText ?? false,
              keyboardType: keyboardType,
              style: TextStyle(fontSize: width * 0.04),
              decoration: InputDecoration(border: InputBorder.none,
                hintText: hintText ?? "",
                hintStyle: TextStyle(fontSize: width * 0.04),
               // contentPadding: EdgeInsets.symmetric(horizontal: width * 0.03),
              ),
            ),
          ),
        ),
      ],
    );
  }
}