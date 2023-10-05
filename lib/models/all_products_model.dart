// To parse this JSON data, do
//
//     final allProducts = allProductsFromJson(jsonString);

import 'dart:convert';

AllProducts allProductsFromJson(String str) =>
    AllProducts.fromJson(json.decode(str));

String allProductsToJson(AllProducts data) => json.encode(data.toJson());

class AllProducts {
  final bool? isSuccess;
  final List<Datum>? data;

  AllProducts({
    this.isSuccess,
    this.data,
  });

  factory AllProducts.fromJson(Map<String, dynamic> json) => AllProducts(
        isSuccess: json["isSuccess"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "isSuccess": isSuccess,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  final String? id;
  final String? userId;
  final String? imageId;
  final String? sellerBrandName;
  final String? productName;
  final String? originalPrice;
  final String? salePrice;
  final String? productDescription;
  final String? latitude;
  final String? longitude;
  final String? distance;

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
    this.distance,
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
        distance: json["distance"],
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
        "distance": distance,
      };
}
