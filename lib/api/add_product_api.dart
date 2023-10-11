import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sellproducts/constant/common.dart';
import 'package:sellproducts/constants/locals.g.dart';
import 'package:sellproducts/modules/home/model/product_data_model.dart';
import 'package:sellproducts/modules/home/model/product_long_data_model.dart';
import '../network/http_service.dart';
import 'package:http/http.dart' as http;

class AddProductApi {
  static addProductApi(Map<String, dynamic> body) async {
    try {
      String url = LocaleKeys.baseURL + LocaleKeys.addProductURL;
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
      } else {
        flutterToastBottom(jsonDecode(response!.body)["message"]);
      }
    } catch (e) {
      print("=====>>>  $e");
    }
  }


 static Future LocationGetDataApi(Map<String, dynamic> body) async {
    try {
      String url = LocaleKeys.baseURL + LocaleKeys.locationGetProduct;

      // Encode the request body as a JSON string
      String bodyJson = jsonEncode(body);

      http.Response? response = await HttpService.postApi(
        url: url,
        header: {
          "Content-Type": "application/json",
        },
        body: bodyJson, // Use the JSON-encoded string as the body
      );

      if (response != null && response.statusCode == 200) {
        String? status = jsonDecode(response.body)["status"];
        if (status != "success") {
          // Handle the case where status is not "success"
        } else if (status == "success") {
          debugPrint(response.body);
        }
        flutterToastBottomGreen(jsonDecode(response.body)["message"]);
        return productDataModelFromJson(response.body);

      } else {
        flutterToastBottom(jsonDecode(response!.body)["message"]);
      }
    } catch (e) {
      print("=====>>>  $e");
    }
  }

  static Future LocationGetLongDataApi(Map<String, dynamic> body) async {
    try {
      String url = LocaleKeys.baseURL + LocaleKeys.locationGetLongProduct;

      // Encode the request body as a JSON string
      String bodyJson = jsonEncode(body);

      http.Response? response = await HttpService.postApi(
        url: url,
        header: {
          "Content-Type": "application/json",
        },
        body: bodyJson, // Use the JSON-encoded string as the body
      );

      if (response != null && response.statusCode == 200) {
        String? status = jsonDecode(response.body)["status"];
        if (status != "success") {
          // Handle the case where status is not "success"
        } else if (status == "success") {
          debugPrint(response.body);
        }
        flutterToastBottomGreen(jsonDecode(response.body)["message"]);
        return productLongDataModelFromJson(response.body);

      } else {
        flutterToastBottom(jsonDecode(response!.body)["message"]);
      }
    } catch (e) {
      print("=====>>>  $e");
    }
  }
}
