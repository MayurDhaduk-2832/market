// To parse this JSON data, do
//
//     final searchProductsModel = searchProductsModelFromJson(jsonString);

import 'dart:convert';

SearchProductsModel searchProductsModelFromJson(String str) => SearchProductsModel.fromJson(json.decode(str));

String searchProductsModelToJson(SearchProductsModel data) => json.encode(data.toJson());

class SearchProductsModel {
  bool? isSuccess;
  List<Datum>? data;

  SearchProductsModel({
    this.isSuccess,
    this.data,
  });

  factory SearchProductsModel.fromJson(Map<String, dynamic> json) => SearchProductsModel(
    isSuccess: json["isSuccess"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String? id;
  String? userId;
  String? imageId;
  String? sellerBrandName;
  String? productName;
  String? originalPrice;
  String? salePrice;
  String? productDescription;
  String? latitude;
  String? longitude;

  Datum({
    this.id,
    this.userId,
    this.imageId,
    this.sellerBrandName,
    this.productName,
    this.originalPrice,
    this.salePrice,
    this.productDescription,
    this.latitude,
    this.longitude,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["userId"],
    imageId: json["image_id"],
    sellerBrandName: json["seller_brand_name"],
    productName: json["product_name"],
    originalPrice: json["original_price"],
    salePrice: json["sale_price"],
    productDescription: json["product_description"],
    latitude: json["latitude"],
    longitude: json["longitude"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "image_id": imageId,
    "seller_brand_name": sellerBrandName,
    "product_name": productName,
    "original_price": originalPrice,
    "sale_price": salePrice,
    "product_description": productDescription,
    "latitude": latitude,
    "longitude": longitude,
  };
}
