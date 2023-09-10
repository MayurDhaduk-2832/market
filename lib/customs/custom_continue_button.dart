import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContinueButtonCommonWidget extends StatelessWidget {

  final String? text;
  late VoidCallback? onTap;

   ContinueButtonCommonWidget({
    super.key,
    this.text,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height * 0.02),
        GestureDetector(
          onTap: onTap,
            child: Container(
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
            child:  Text(
              text ?? "",
              style:
               TextStyle(fontSize: width * 0.04, fontWeight: FontWeight.w800),
            ),
          ),
        ),
      ],
    );
  }
}