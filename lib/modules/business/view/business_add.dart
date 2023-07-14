// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusinessAddScreen extends StatefulWidget {
  const BusinessAddScreen({super.key});

  @override
  State<BusinessAddScreen> createState() => _BusinessAddScreenState();
}

class _BusinessAddScreenState extends State<BusinessAddScreen> {
  final height = Get.height;
  final width = Get.width;
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
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
              child: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.black,
              ),
            ),
            Center(
              child: Container(
                height: height * 0.13,
                width: height * 0.13,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 5,
                      )
                    ],
                    borderRadius: BorderRadius.circular(height * 0.075)),
                child: const Icon(
                  Icons.person,
                  size: 40,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            const Center(
              child: Text(
                "Name",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  CustomTextField(
                      icon: Icons.person,
                      controller: nameController,
                      hintText: "Enter Name"),
                  CustomTextField(
                      icon: Icons.phone,
                      controller: nameController,
                      hintText: "Enter Mobile"),
                  CustomTextField(
                      icon: Icons.home,
                      controller: nameController,
                      hintText: "Enter Address"),
                  CustomTextField(
                      icon: Icons.phone,
                      controller: nameController,
                      hintText: "Enter Instagram Page"),
                  CustomTextField(
                      icon: Icons.person,
                      controller: nameController,
                      hintText: "Enter Whatsapp Link"),
                  CustomTextField(
                      icon: Icons.person,
                      controller: nameController,
                      hintText: "Enter Whatsapp Link"),
                ],
              ),
            ),
            Container(
              height: height * 0.065,
              width: width,
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(30)),
              child: const Text(
                "Continue",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  letterSpacing: 0.9,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  IconData icon;
  TextEditingController controller;
  String hintText;

  CustomTextField(
      {super.key,
      required this.icon,
      required this.controller,
      required this.hintText});

  final height = Get.height;
  final width = Get.width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.067,
      width: width,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 5,
            offset: const Offset(-2, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: height * 0.045,
            width: height * 0.045,
            margin: const EdgeInsets.only(left: 10, right: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 2,
                ),
              ],
            ),
            child: Icon(
              icon,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: TextField(
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.6,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
