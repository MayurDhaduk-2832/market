import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  dynamic argumentData = Get.arguments;
  String saleProductName="";
  String saleProductImage="";
  @override
  void initState() {
    super.initState();
    // _service = BusinessCreateViewModel(context);
    if (argumentData != null && argumentData is Map<String, dynamic>) {
      saleProductName = argumentData['saleProductName'];
      saleProductImage = argumentData['saleProductImage'];
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor:Colors.brown.shade50,
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.only(left:width * 0.06,right: width * 0.06),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: height * 0.05,
                          width: height * 0.05,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 2)
                              ]),
                          child:  Icon(Icons.arrow_back,size: width * 0.05,),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: height * 0.05,
                          width: height * 0.05,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 0,
                                    offset: Offset(0, 4),
                                    color: Colors.black.withOpacity(0.25),
                                    blurRadius: 4)
                              ],
                              borderRadius: BorderRadius.circular(30)),
                          child: Icon(Icons.share,size: width * 0.05,),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.03,),
                Container(alignment: Alignment.center,height: height * 0.5,margin: EdgeInsets.all(25),
                  //   padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.white,
                    boxShadow:  [
                      BoxShadow(
                          spreadRadius: 0,
                          // blurStyle: BlurStyle.outer,
                          offset: Offset(0, 4),
                          color: Colors.black.withOpacity(0.25),
                          blurRadius: 4
                      )
                    ],
                  ),
                  child: Container(height: height * 0.44,width: width * 0.8,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(fit: BoxFit.fill,image: AssetImage(saleProductImage))),
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(saleProductName,style: TextStyle(fontSize: height * 0.03),),
                      Container(height: height * 0.04,width: width * 0.2,decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                        boxShadow:  [
                          BoxShadow(
                              spreadRadius: 0,
                              // blurStyle: BlurStyle.outer,
                              offset: Offset(0, 4),
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 4
                          )
                        ],
                      ),
                      child: const Row(children: [
                        Expanded(child: Icon(Icons.star,color: Colors.amber,)),
                        Expanded(child: Text("4.9"))
                      ]),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
