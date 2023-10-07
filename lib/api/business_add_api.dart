import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sellproducts/constant/common.dart';
import 'package:sellproducts/constants/locals.g.dart';
import '../network/http_service.dart';
import 'package:http/http.dart' as http;

class AddBusinessApi {
  static Future addBusinessApi(Map<String, dynamic> body) async {
    try {
      String url = LocaleKeys.baseURL + LocaleKeys.businessCreateURL;
      String bodyJson = jsonEncode(body);
      http.Response? response = await HttpService.postApi(
          url: url,
          header: {
            "Content-Type": "application/json",
          },
          body: bodyJson);
      if (response != null && response.statusCode == 200) {
        String? status = jsonDecode(response.body)["status"];
        if (status != "success") {
        } else if (status == "success") {
          debugPrint(response.body);
        }

        flutterToastBottomGreen(jsonDecode(response.body)["message"]);
        return response.body;
      } else {
        flutterToastBottom(jsonDecode(response!.body)["message"]);
      }
    } catch (e) {
      print("=====>>>  $e");
    }
  }
}
