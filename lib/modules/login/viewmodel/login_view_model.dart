import 'package:flutter/material.dart';
import 'package:sellproducts/modules/login/model/login_view_model.dart';
import '../../../../network/base_api_service.dart';

class LoginViewModel extends BaseApiService {
  LoginViewModel(BuildContext context) : super(context);

  Future<LoginModel?> login(String email, String password) async {
    return callApi(
      client.login(email: email, password: password),
    );
  }
}
