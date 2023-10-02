import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ButtonCommonWidget extends StatelessWidget {

  final GestureTapCallback? onTap;

  ButtonCommonWidget({
    super.key,
   this.onTap
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return   GestureDetector(
      onTap:onTap,
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          height: height * 0.05,
          width: height * 0.05,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 35),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 4)
            ],
          ),
          child: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
            size:  width * 0.05,
          ),
        ),
      ),
    );
  }
}