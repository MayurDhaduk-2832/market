import 'package:flutter/material.dart';
import 'package:sellproducts/modules/register/model/register_model.dart';
import '../../../../network/base_api_service.dart';

class RegisterViewModel extends BaseApiService {
  RegisterViewModel(BuildContext context) : super(context);

  Future<RegisterModel?> register(String vUsername, String vMobile,
      String vEmail, String vPassword, int iRole) async {
    return callApi(
      client.register(
          username: vUsername,
          mobileNumber: vMobile,
          email: vEmail,
          password: vPassword,
          role: iRole),
    );
  }
}
