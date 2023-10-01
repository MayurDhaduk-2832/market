import 'dart:convert';

import 'package:sellproducts/constants/locals.g.dart';
import 'package:sellproducts/models/all_products_model.dart';
import 'package:sellproducts/modules/login/model/login_view_model.dart';
import '../network/http_service.dart';
import 'package:http/http.dart' as http;

class OutRangeProductApi {
  static outRangeProductApi(Map<String, dynamic> body) async {
    try {
      String url = LocaleKeys.baseURL + LocaleKeys.outRangeProductUrl;
      http.Response? response = await HttpService.postApi(
          url: url,
          header: {
            "Content-Type": "application/json",
          },
          body: body);
      if (response != null && response.statusCode == 200) {
        return allProductsFromJson(response.body);
      }
      return LoginModel.fromJson(jsonDecode(""));
    } catch (e) {
      print("=====>>>  $e");
    }
  }
}
