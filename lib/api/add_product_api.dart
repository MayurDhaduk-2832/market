import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sellproducts/constant/common.dart';
import 'package:sellproducts/constants/locals.g.dart';
import 'package:sellproducts/models/all_products_model.dart';
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

  static Future LocationGetDataApi({body}) async {
    try {
      String url = LocaleKeys.baseURL + LocaleKeys.locationGetProduct;
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
        debugPrint("less product=>${response.body}");
        // flutterToastBottomGreen(jsonDecode(response.body)["message"]);
        return allProductsFromJson(response.body);
      } else {
        //  flutterToastBottom(jsonDecode(response!.body)["message"]);
      }
    } catch (e) {
      print("=====>>>  $e");
    }
  }

  static Future LocationGetLongDataApi({body}) async {
    try {
      String url = LocaleKeys.baseURL + LocaleKeys.locationGetLongProduct;
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
        debugPrint("long product=>${response.body}");
        // flutterToastBottomGreen(jsonDecode(response.body)["message"]);
        return allProductsFromJson(response.body);
      } else {
        //  flutterToastBottom(jsonDecode(response!.body)["message"]);
      }
    } catch (e) {
      print("=====>>>  $e");
    }
  }


}
