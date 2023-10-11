import 'dart:convert';
import 'package:sellproducts/constant/common.dart';
import 'package:sellproducts/constants/locals.g.dart';
import 'package:sellproducts/modules/home/model.dart';
import '../network/http_service.dart';
import 'package:http/http.dart' as http;


class CategoryApi {
 static Future CategoryUserApi() async {
    try {
      String url = LocaleKeys.baseURL + LocaleKeys.categorice;

      // Encode the request body as a JSON string


      http.Response? response = await HttpService.getApi(
        url: url,
        header: {
          "Content-Type": "application/json",
        }, // Use the JSON-encoded string as the body
      );

      if (response != null && response.statusCode == 200) {
        return categoryModelFromJson(response.body);
      } else {
        flutterToastBottom(jsonDecode(response!.body)["message"]);
      }
    } catch (e) {
      print("=====>>>  $e");
    }
  }
}
