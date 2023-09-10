import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchTextFieldCommonWidget extends StatelessWidget {
  late String? hintText;
  TextEditingController? controller;
  final ValueChanged<String>? onChanged;


  SearchTextFieldCommonWidget({
    super.key,
    this.hintText,
    this.controller,
    this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Container(
      alignment: Alignment.center,
      height: height * 0.06,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 4),
                color: Colors.black38,
                blurRadius: 4)
          ]),
      child:TextField(cursorColor: Colors.black,
        onChanged: onChanged,
        controller: controller,
        style: TextStyle(fontSize: width * 0.04),
        decoration: InputDecoration(border: InputBorder.none,
            hintText: hintText ?? "",
            hintStyle: TextStyle(fontSize: width * 0.04),
            prefixIcon:   Icon(
              Icons.search,
              color: Colors.black,
              size: height * 0.04,
            ),
            suffixIcon: Padding(
              padding:  EdgeInsets.symmetric(horizontal: width * 0.02,vertical: height * 0.01),
              child: Image.asset(
                "assets/filterIcon.png",
              ),),
          contentPadding: EdgeInsets.symmetric(vertical: height * 0.02),
        ),
      ),
    );
  }
}