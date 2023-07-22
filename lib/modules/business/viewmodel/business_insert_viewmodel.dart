import 'package:flutter/material.dart';
import 'package:sellproducts/modules/register/model/register_model.dart';
import '../../../../network/base_api_service.dart';

class BusinessCreateViewModel extends BaseApiService {
  BusinessCreateViewModel(BuildContext context) : super(context);

  Future<RegisterModel?> register(
      int user_id,
      String bussiness_name,
      String contact_number,
      String categorys,
      String address,
      String location_longlat,
      String images) async {
    return callApi(
      client.businessInsert(
          user_id: user_id,
          bussiness_name: bussiness_name,
          contact_number: contact_number,
          categorys: categorys,
          address: address,
          location_longlat: location_longlat,
          images: images),
    );
  }

  // uploadFile(File path,{String fileType = "pdf"}) async {
  //   return await callApi(
  //     client.filesUpload(token ?? "", path),
  //   );
  // }
}
