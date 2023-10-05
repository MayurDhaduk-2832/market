import 'dart:convert';

import 'package:sellproducts/constants/locals.g.dart';
import 'package:sellproducts/modules/login/model/login_view_model.dart';
import '../network/http_service.dart';
import 'package:http/http.dart' as http;

class LoginApi {
 static Future loginApi(Map<String, dynamic> body) async {
    try {
      String url = LocaleKeys.baseURL + LocaleKeys.loginUpURL;
      String bodyJson = jsonEncode(body);
      http.Response? response = await HttpService.postApi(
          url: url,
          header: {
            "Content-Type": "application/json",
          },
          body: bodyJson);
      if (response != null && response.statusCode == 200) {
        // return LoginModel.fromJson(jsonDecode(response.body));
        return loginModelFromJson(response.body);
      }
      return LoginModel.fromJson(jsonDecode(""));
    } catch (e) {
      print("=====>>>  $e");
    }
  }
}
