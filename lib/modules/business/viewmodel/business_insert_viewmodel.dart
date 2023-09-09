import 'package:flutter/material.dart';
import 'package:sellproducts/modules/business/model/categorice_model.dart';
import 'package:sellproducts/modules/register/model/register_model.dart';
import '../../../../network/base_api_service.dart';

class BusinessCreateViewModel extends BaseApiService {
  BusinessCreateViewModel(BuildContext context) : super(context);

  Future<RegisterModel?> register(
      String user_id,
      String bussiness_name,
      String contact_number,
      List categorys,
       String country,
       String state,
       String city,
       String address,
      String pincode,
       String long,
       String lat) async {
    return callApi(
      client.businessInsert(
          user_id: user_id,
          bussiness_name: bussiness_name,
          contact_number: contact_number,
          categorys: categorys,
        country: country,
          state: state,
          city: city,
        address: address,
          pincode: pincode,
          long: long,
          lat: lat
      ),
    );
  }


  // get
  Future<CategoriesModel?> getCategory() async {
    return callApi(
      client.getCategory(),
    );
  }

  // uploadFile(File path,{String fileType = "pdf"}) async {
  //   return await callApi(
  //     client.filesUpload(token ?? "", path),
  //   );
  // }
}
